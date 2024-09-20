class ValidatorClass{

bool _validateFormKey(formKey) {
   
    if (formKey.currentState?.validate() ?? false) {
      return true;
    } else {
      return false;
    }
  }
  bool formValidator(formkey){
    
    return _validateFormKey(formkey);

  }

}