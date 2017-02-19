from django.contrib import admin
from .models import *

class TaxonomyAdmin(admin.ModelAdmin):
    list_display = ('label','taxonomy_type')
admin.site.register(Taxonomy,TaxonomyAdmin)

class ReviewAdmin(admin.ModelAdmin):
    list_display = ('person','game','rating')
    pass
admin.site.register(Review,ReviewAdmin)

class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'first_name', 'last_name', 'user_type')
admin.site.register(User,UserAdmin)

class GameAdmin(admin.ModelAdmin):
    list_display = ('id', 'title','owner','is_featured')
admin.site.register(Game, GameAdmin)

class AssetAdmin(admin.ModelAdmin):
    list_display = ('game', 'url')
    pass
admin.site.register(Asset,AssetAdmin)

class GameplayAdmin(admin.ModelAdmin):
    pass
admin.site.register(Gameplay,GameplayAdmin)

class PurchaseAdmin(admin.ModelAdmin):
    pass
admin.site.register(Purchase,PurchaseAdmin)
