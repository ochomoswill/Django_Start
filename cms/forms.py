from .models import Testimonials
from django import forms

class ReviewForm(forms.ModelForm):

    class Meta:
        model = Testimonials
        fields = ('name','email', 'message',)

        labels = {
            'name': 'Name',
            'email': 'Email Address',
            'message': 'Message to Us',
        }
