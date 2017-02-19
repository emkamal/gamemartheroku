import os, sys, io, json, operator
from hashlib import md5
from PIL import Image, ImageOps

from django.conf import settings
from django.http import HttpResponse, Http404
from django.utils import timezone
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Count

from gameapp.forms import *
from gameapp.models import *


def home(request):
    """Home page of GameMart. It shows 3 featured games and 6 latest games."""

    featured_games = load_games(request, 'featured', '', 3)
    latest_games = load_games(request, 'latest', '', 6)

    r = render (
        request,
        'home.html',
        {
            'page_title': 'Javascript Game Marketplace',
            'page_subtitle': 'Sell your games here and let others play',
            'featured_games': featured_games,
            'latest_games': latest_games,
            'next_purchase_id': next_purchase_id(),
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

@login_required
def dashboard(request):
    """User dashboard where user can edit their data."""

    r = render (
        request,
        'account/dashboard.html',
        {
            'page_title': 'User Dashboard',
            'page_subtitle': '',
            'section':'dashboard',
            'user':request.user
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def editProfile(request):
    """Edit profile."""

    r = render (
        request,
        'account/editProfile.html',
        {
            'page_title': 'Edit Profile',
            'page_subtitle': '',
            'user': request.user
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def changeFirstName(request):
    first_name_form = FirstNameForm(request.POST or None, initial={'first_name': 'whatever'})
    if request.method == 'POST':
        if first_name_form.is_valid():
            user = request.user
            firstName = request.POST.get("first_name")
            user.first_name = firstName
            user.save()
            return redirect('user_dashboard')
    else:
        first_name_form = FirstNameForm()

    r = render (
        request,
        'account/editProfile.html',
        {
            'page_title': 'Change First Name',
            'page_subtitle': '',
            'first_name_form': first_name_form
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def changeLastName(request):
    last_name_form = LastNameForm(request.POST or None, initial={'last_name': 'whatever'})
    if request.method == 'POST':
        if last_name_form.is_valid():
            user = request.user
            lastName = request.POST.get("last_name")
            user.last_name = lastName
            user.save()
            return redirect('user_dashboard')
    else:
        last_name_form = LastNameForm()

    r = render (
        request,
        'account/editProfile.html',
        {
            'page_title': 'Change Last Name',
            'page_subtitle': '',
            'last_name_form': last_name_form
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def changeEmail(request):
    email_form = EmailForm(request.POST or None, initial={'email': 'whatever'})
    error = ''
    if request.method == 'POST':
        if email_form.is_valid():
            user = request.user
            email = request.POST.get("email")
            try:
                emails = User.objects.get(email=email)
            except User.DoesNotExist:
                emails = None

            if emails is None:
                user.email = email
                user.save()
                return redirect('user_dashboard')
            else:
                error = 'Email already in use'

    else:
        email_form = EmailForm()

    r = render (
        request,
        'account/editProfile.html',
        {
            'page_title': 'Change Email',
            'page_subtitle': '',
            'email_form': email_form,
            'error': error
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def changeBio(request):
    bio_form = BioForm(request.POST or None, initial={'bio': 'whatever'})
    if request.method == 'POST':
        if bio_form.is_valid():
            user = request.user
            bio = request.POST.get("bio")
            user.bio = bio
            user.save()
            return redirect('user_dashboard')
    else:
        bio_form = BioForm()

    r = render (
        request,
        'account/editProfile.html',
        {
            'page_title': 'Change Bio',
            'page_subtitle': '',
            'bio_form': bio_form
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def register(request):
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)
        if user_form.is_valid():
            user = user_form.save()
            user.set_password(user.password)
            user.save()
            messages.success(request, "Registration Successful!!!")
            return redirect('login')

        else:
            messages.error(request, "Registration Unsuccessful!!!")
    else:
        user_form = UserForm()

    r = render (
        request,
        'register.html',
        {
            'page_title': 'Register',
            'page_subtitle': '',
            'form': user_form
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def browse(request):
    """Browse page."""

    games = load_games(request, 'all')

    r = render (
        request,
        'browse.html',
        {
            'page_title': 'Games collection',
            'page_subtitle': 'Explore our game collection',
            'games': games,
            'next_purchase_id': next_purchase_id()
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def explore(request, type):
    """Explore games."""

    if type == 'featured':
        page_title = 'Featured'
        games = load_games(request, 'featured')
    elif type == 'latest':
        page_title = 'Latest'
        games = load_games(request)
    elif type == 'top-rated':
        page_title = 'Top Rated'
        games = load_games(request)
    elif type == 'top-grossing' or type == 'most-played':
        page_title = type.replace('-', ' ').title()
        games = load_games(request, type)
    else:
        raise Http404

    paginated_games = games_paginator(request, games, 9)

    r = render (
        request,
        'browse.html',
        {
            'page_title': page_title + " Games",
            'page_subtitle': '',
            'games': paginated_games,
            'next_purchase_id': next_purchase_id()
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def explore_by_taxonomy(request, tag):
    """Browse games based on tag id."""

    target = Taxonomy.objects.get(slug=tag)
    page_title = target.label
    tag_id = target.id

    games = load_games(request, 'tag', tag_id)
    r = render (
        request,
        'browse.html',
        {
            'page_title': page_title + " Games",
            'page_subtitle': '',
            'games': games
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

def submit(request):
    """Submit games."""

    if not request.user.is_authenticated:
        messages.add_message(request, messages.WARNING, "Sorry, please login to submit a game")
        return redirect((settings.LOGIN_URL))
    if request.method == "POST":
        form = SubmitForm(request.POST, request.FILES)
        if form.is_valid():
            game = form.save(request)
            game.save()

            categories = form.cleaned_data['categories']

            for category in categories:
                game.taxonomies.add(category.id)

            handle_uploaded_file(request, request.FILES['image'], game)

            messages.add_message(request, messages.INFO, "Your game has been submitted")
            return redirect('developer')

        else:
            messages.error(request, "Game submit failed!!!")
    else:
        form = SubmitForm()

    r = render (
        request,
        'submit.html',
        {
            'page_title': 'Submit Games',
            'form': form
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def developer(request):
    """Developer dashboard."""
    if not request.user.is_authenticated:
        messages.add_message(request, messages.WARNING, "Sorry, please login to access the dashboard")
        return redirect((settings.LOGIN_URL))

    games = Game.objects.filter(owner_id=request.user.id)
    games_output = []
    sales_output = []
    total_income = 0
    total_play = 0
    total_game = games.count()
    buyers = []

    for game in games:
        purchases = game.purchase_set.filter(status='success')

        games_output.append({
            'id': game.id,
            'title': game.title,
            'price': game.price,
            'income': game.price*game.purchase_set.count(),
            'featured': game.is_featured,
            'slug': game.slug,
            'added_date': game.added_date,
            'purchase_count': game.purchase_set.count(),
            'play_count': game.gameplay_set.count(),
        })

        total_play += game.gameplay_set.count()

        for purchase in purchases:
            user = User.objects.get(id=purchase.buyer_id)

            sales_output.append({
                'id': purchase.id,
                'game_slug': game.slug,
                'game_title': game.title,
                'buyer_name': user.username,
                'bought_date': purchase.date,
                'amount': purchase.amount
            })

            if user.username not in buyers:
                buyers.append(user.username)

            total_income += purchase.amount

    r = render (
        request,
        'developer.html',
        {
            'page_title': 'Developer Dashboard',
            'games': games_output,
            'sales': sales_output,
            'total_income': total_income,
            'total_play': total_play,
            'total_game': total_game,
            'total_buyer': len(buyers),
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

def edit_game(request, game_id):
    """Edit game."""
    game = Game.objects.get(id=game_id)

    if not request.user.is_authenticated():
        messages.add_message(request, messages.WARNING, "Sorry, please login to update a game")
        return redirect((settings.LOGIN_URL))

    if game.owner_id != request.user.id:
        messages.add_message(request, messages.WARNING, "Sorry, you can't edit this game")
        return redirect('developer')

    if request.method == "POST":
        form = SubmitForm(request.POST, request.FILES, instance=game)
        if form.is_valid():
            game = form.save(request)
            game.save()

            categories = form.cleaned_data['categories']

            for category in categories:
                game.taxonomies.add(category.id)

            handle_uploaded_file(request, request.FILES['image'], game)
            messages.add_message(request, messages.INFO, "Your game has been updated")
            return redirect('developer')
    else:

        data = {
            'id': game.id,
            'title': game.title,
            'desc': game.desc,
            'instruction': game.instruction,
            'url': game.url,
            'price': game.price
        }
        form = SubmitForm(initial=data)

    r = render (
        request,
        'edit_game.html',
        {
            'page_title': 'Edit game',
            'form': form,
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

def del_game(request, game_id):
    """Delete game."""
    if request.user.is_authenticated():
        game = Game.objects.get(id=game_id)
        if game.owner_id == request.user.id:
            game.delete()
            messages.add_message(request, messages.INFO, "Your game has been deleted")
            return redirect('developer')
        else:
            messages.add_message(request, messages.WARNING, "Sorry, you can't delete that game")
            redirect('developer')
    else:
        messages.add_message(request, messages.WARNING, "Sorry, please login to delete a game")
        redirect('login')

    return redirect('login')

def game_by_slug(request, slug):
    """Show game page based on its slug."""
    game = get_object_or_404(Game, slug=slug)

    if request.user.is_authenticated():
        g = Gameplay(score=0, state='openpage', game_id=game.id, player_id=request.user.id)
        g.save()

    game_bought = False

    if(request.user.is_authenticated()):
        user_purchases = Purchase.objects.filter(buyer_id=request.user.id)
        if user_purchases.exists():
            for user_purchase in user_purchases:
                if user_purchase.game_id == game.id and user_purchase.status == 'success' :
                    game_bought = True


    gameplays = Gameplay.objects.filter(game_id=game.id).order_by('score')

    highscore = {}
    play_count = 0
    for gameplay in gameplays:
        play_count += 1
        if gameplay.score is not None:
            if gameplay.player_id in highscore:
                if gameplay.score > highscore[gameplay.player_id]:
                    highscore[gameplay.player_id] = gameplay.score
            else:
                highscore[gameplay.player_id] = gameplay.score

    highscore_output = {}
    for key, score in highscore.items():
        # user = get_object_or_404(User, id=int(key))
        user = User.objects.get(pk=int(key))
        highscore_output[user.username] = highscore[key]

    highscore_sorted = sorted(highscore_output.items(), key=operator.itemgetter(1), reverse=True)

    checksum = get_checksum(game.price)

    purchases = Purchase.objects.filter(game_id=game.id)

    game_banner_url = 'none';
    for asset in game.asset_set.all():
        if asset.asset_type == 'game-banner-750x400':
            game_banner_url = asset.url
            break

    r = render (
        request,
        'gameview.html',
        {
            'page_title': game.title,
            'game': game,
            'game_banner_url': game_banner_url,
            'next_purchase_id': next_purchase_id(),
            'checksum': checksum,
            'game_bought': game_bought,
            'highscore': highscore_sorted,
            'play_count': play_count,
            'purchase_count': purchases.count()
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

def payment(request, status, slug):
    """Payment callback page.

    Keyword arguments:
    request -- the standard django request object
    status -- status of the payment, it could either be success, cancelled or error
    slug -- slug of the game which was being purchased
    """

    if not request.user.is_authenticated():
        messages.add_message(request, messages.INFO, "Your Message")
        return redirect('login')

    game = get_object_or_404(Game, slug=slug)
    try:
        purchase = Purchase(amount=game.price, buyer_id=request.user.id, game_id=game.id, status=status)
    except Purchase.DoesNotExist:
        raise Http404("There is no purchase data yet")

    purchase.save()

    r = render (
        request,
        'payment.html',
        {
            'page_title': 'Payment Status',
            'page_subtitle': '',
            'status': status,
            'game': game
        },
        content_type='application/xhtml+xml'
    )

    return HttpResponse(r)

# TODO: develop separate app for API to allow more versatile API architecture
def api(request, target):
    """API access for all endpoint.

    Keyword arguments:
    request -- the standard django request object
    target -- target endpoint, it could game, user, gameplay or highscore
    """
    output = {}

    if target == 'game':
        target_model = Game
    elif target == 'user':
        target_model = User
    elif target == 'gameplay' or target == 'highscore':
        target_model = Gameplay
    else:
        return HttpResponse('{}', content_type="application/json") # return empty json if targetting non existing endpoint

    if request.method == 'GET':

        objects = target_model.objects.all();

        if target == 'gameplay' and request.GET.get("game_id") is not None:
            objects = objects.filter(game_id=request.GET.get("game_id"), player_id=request.user.id).latest('timestamp')

        if target == 'highscore' and request.GET.get("game_id") is not None:
            objects = objects.filter(game_id=request.GET.get("game_id"))
            highscores = getHighscores(objects)
            output = highscores

        try:
            _ = (e for e in objects)
        except TypeError:
            output = {
                'id': objects.id,
                'score': objects.score,
                'state': objects.state,
                'game_id': objects.game_id,
                'player_id': objects.player_id,
            }
        else:
            i = 0
            for obj in objects:
                if target == 'game':
                    output[i] = {
                        'id': obj.id,
                        'title': obj.title,
                        'price': obj.price,
                    }
                elif target == 'user':
                    output[i] = {
                        'id': obj.id,
                        'first_name': obj.first_name,
                        'last_name': obj.last_name,
                    }
                elif target == 'gameplay':
                    output[i] = {
                        'id': obj.id,
                        'score': obj.score,
                        'state': obj.state,
                        # 'timestamp': obj.timestamp,
                        'game_id': obj.game_id,
                        'player_id': obj.player_id,
                    }

                i = i+1

        json_dump = json.dumps(output)

        return HttpResponse(json_dump, content_type="application/json")

    elif request.method == 'POST':
        data = request.POST
        if target == 'gameplay':
            try:
                g = Gameplay(score=data.get('score'), state=data.get('state'), game_id=data.get('game_id'), player_id=request.user.id)
                g.save()
                return HttpResponse('success', content_type="application/json")
            except Gameplay.DoesNotExist:
                raise Http404("Gameplay does not exist")
            except Exception as e:
                return HttpResponse(e, content_type="application/json")
        else:
            return HttpResponse(target, content_type="application/json")

def search(request):
    """Search feature.

    It takes 'keywords' query string as the keywords to be searched. Return list of games object which match the search.
    """

    if(request.GET.get("keywords") is None):
        keywords_string = ''
    else:
        keywords_string = request.GET.get("keywords")

    keywords = keywords_string.split(' ')
    objects_list = []
    output = Game.objects.none()

    # Retrieve game objects for every keywords
    for keyword in keywords:
        objects_list.append(Game.objects.filter(title__icontains=keyword))
        objects_list.append(Game.objects.filter(desc__icontains=keyword))

    # Aggregate all the retrieved game objects
    for obj in objects_list:
        output = output | obj

    # Convert the games object to games dictionary object to be passed to the template
    games = build_games_view(request, output)

    paginated_games = games_paginator(request, games, 9)

    r = render (
        request,
        'search.html',
        {
            'page_title': keywords_string + " games",
            'games': paginated_games,
            'search_string': 'keywords='+keywords_string
        },
        content_type='application/xhtml+xml'
    )
    return HttpResponse(r)

def load_games(request, mode="all", tags="", num=3):
    """Return games dictionary object to be passed to the template.

    Keyword arguments:
    request -- the standard django request object
    mode -- the kind of games list that want to be loaded, choose between all, featured, latest, top-grossing, most-played and tag
    tags -- id of the tag, if the mode is set to tag, it will get this argument
    num -- number of games to be loaded
    """

    try:
        games = []
        if mode == "all":
            games_querysets = Game.objects.order_by('-added_date')
        elif mode == "featured":
            games_querysets = Game.objects.filter(is_featured=True)[:num]
        elif mode == "latest":
            games_querysets = Game.objects.all().order_by('-added_date')[:num]
        elif mode == "top-grossing":
            games_querysets = Game.objects.all().annotate(num_purchase=Count('purchase')).order_by('-num_purchase')
        elif mode == "most-played":
            games_querysets = Game.objects.all().annotate(num_gameplay=Count('gameplay')).order_by('-num_gameplay')
        elif mode == "tag":
            games_querysets = Game.objects.filter(taxonomies=tags)

        games = build_games_view(request, games_querysets)

        return games

    except Game.DoesNotExist:
        raise Http404("Game does not exist")

def games_paginator(request, games, num_per_page):
    """Build paginated games object to be used on the browse feature.

    Keyword arguments:
    request -- the standard django request object
    games -- games list object to be paginated
    num_per_page -- number of games to be shown per page
    """
    paginator = Paginator(games, num_per_page)

    page = request.GET.get('page')

    try:
        paginated_games = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        paginated_games = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        paginated_games = paginator.page(paginator.num_pages)

    return paginated_games

def build_games_view(request, querysets):
    """Build games dictionary object to be passed to the template.

    Keyword arguments:
    request -- the standard django request object
    querysets -- the game querysets which will be converted to game dictionary data
    """

    # Get current logged in user owner games
    user_owned_games = [];
    if(request.user.is_authenticated()):
        user_purchases = Purchase.objects.filter(buyer_id=request.user.id)
        if user_purchases.exists():
            for user_purchase in user_purchases:
                user_owned_games.append(user_purchase.game_id)

    output = []

    for game in querysets:
        game_banner_url = settings.BASE_URL+'/media/site/no-image-400x250.jpg';
        for asset in game.asset_set.all():
            if asset.asset_type == 'game-banner-400x250':
                game_banner_url = asset.url
                break

        if game.id in user_owned_games:
            game_bought = True
        else:
            game_bought = False

        checksum = get_checksum(game.price)

        output.append({
            'id': game.id,
            'title': game.title,
            'price': game.price,
            'desc': game.desc,
            'slug': game.slug,
            'banner_url': game_banner_url,
            'bought': game_bought,
            'checksum': checksum
        })

    return output

def handle_uploaded_file(request, file, game):
    """Move uploaded image for game banner to the corresponding folder and generate thumbnails.

    Keyword arguments:
    request -- the standard django request object
    file -- the file object from the form
    game -- game object to refer the file with its game id
    """

    folder = 'media/games/' + game.slug
    original_filename, original_fileext = os.path.splitext(request.FILES['image'].name)
    uploaded_filename = game.slug+"-banner-original-size"+original_fileext

    # create the folder if it doesn't exist.
    try:
        os.mkdir(os.path.join(settings.BASE_DIR, folder))
    except:
        pass

    # save the uploaded file inside that folder.
    full_filename = os.path.join(settings.BASE_DIR, folder, uploaded_filename)
    fout = io.open(full_filename, 'wb+')

    # Iterate through the chunks.
    for chunk in file.chunks():
        fout.write(chunk)
    fout.close()

    generate_thumbnails(full_filename, game)

def generate_thumbnails(filename, game):
    """Generate thumbnails for newly submitted/updated game banner image.

    Keyword arguments:
    filename -- the filename of the the newly uploaded original image
    game -- game object to refer the thumbnails with its game id
    """

    sizes = {
        '128x128': (128, 128),
        '400x250': (400, 250),
        '750x400': (750, 400)
    }

    for key, size in sizes.items():
        outfile = filename.replace('original-size', key)

        try:
            im = Image.open(filename)
            thumb = ImageOps.fit(im, size, Image.ANTIALIAS)
            thumb.save(outfile, "JPEG")

            asset = Asset(asset_type='game-banner-'+key,url=outfile.replace(settings.BASE_DIR, ''), game_id=game.id)
            asset.save()

        except IOError:
            print("cannot create thumbnail for")

def next_purchase_id():
    """Get the next purchase id to be used on buy form and included in checksum calculation."""

    try:
        purchase = Purchase.objects.latest('id')
    except Purchase.DoesNotExist:
        raise Http404("There is no purchase data yet")

    next_purchase_id = int(purchase.id)+1;
    return next_purchase_id

def get_checksum(amount):
    """Get checksum for buy form.

    Keyword arguments:
    amount -- the price of the product
    """
    checksumstr = "pid={}&sid={}&amount={}&token={}".format(next_purchase_id(), settings.SELLER_ID, amount, settings.PAYMENT_SECRET_KEY)
    checksum = md5(checksumstr.encode("ascii")).hexdigest()
    return checksum

def getHighscores(gameplays):
    """Get list of sorted highscores from a gameplay querysets."""

    highscore = {}
    play_count = 0

    # Iterate through gameplay objects and extract the highscore from each player id
    for gameplay in gameplays:
        play_count += 1
        if gameplay.score is not None:
            if gameplay.player_id in highscore:
                if gameplay.score > highscore[gameplay.player_id]:
                    highscore[gameplay.player_id] = gameplay.score
            else:
                highscore[gameplay.player_id] = gameplay.score

    # Replace the user id as the key on the highscore dictionary with username
    highscore_output = {}
    for key, score in highscore.items():
        user = get_object_or_404(User, pk=int(key))
        highscore_output[user.username] = highscore[key]

    return sorted(highscore_output.items(), key=operator.itemgetter(1), reverse=True)
