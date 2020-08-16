from django import forms


class RegisterForm(forms.Form):
    name = forms.CharField(max_length=32)
    number = forms.CharField()
    password = forms.CharField()

