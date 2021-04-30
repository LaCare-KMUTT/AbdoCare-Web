class PreVisitFormModel {
  Map<String, dynamic> _generalForm;
  Map<String, dynamic> _updateToDatabase;
  Map<String, dynamic> _healthStatusForm;
  Map<String, dynamic> _adlForm;

  PreVisitFormModel getModel() => this;

  Map<String, dynamic> getGeneralForm() => this._generalForm;
  void setGeneralForm(Map<String, dynamic> generalForm) {
    this._generalForm = generalForm;
  }

  Map<String, dynamic> getHealthStatusForm() => this._healthStatusForm;
  void setHealthStatusForm(Map<String, dynamic> healthStatusForm) {
    this._healthStatusForm = healthStatusForm;
  }

  Map<String, dynamic> getADLForm() => this._adlForm;
  void setADLForm(Map<String, dynamic> adlForm) {
    this._adlForm = adlForm;
  }

  Map<String, dynamic> getUpdateToDatabase() => this._updateToDatabase;
  void setUpdateToDatabase(Map<String, dynamic> updateToDatabase) {
    this._updateToDatabase = updateToDatabase;
  }
}
