<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:mprma="urn:customs.ru:Information:SQDocuments:MinpromRawMaterialsAndAccessories:5.13.3">
 <!-- Шаблон для типа MinpromRawMaterialsAndAccessoriesType -->
<xsl:template match="mprma:MinpromRawMaterialsAndAccessories">
<html><head><style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 210mm;
									max-width: 210mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Подтверждение целевого назначения сырья и комплектующих</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="mprma:BDRDID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификатор документа по БД РД</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:BDRDID" /></td></tr></table></xsl:if><xsl:if test="mprma:Confirmation"><div class="title marg-top">Сведения о подтверждении</div></xsl:if><xsl:apply-templates select="mprma:Confirmation" /><xsl:if test="mprma:Applicant"><div class="title marg-top">Заявитель</div></xsl:if><xsl:apply-templates select="mprma:Applicant" /><xsl:if test="mprma:Receiver"><div class="title marg-top">Получатель</div></xsl:if><xsl:apply-templates select="mprma:Receiver" /><xsl:if test="mprma:Contract"><div class="title marg-top">Сведения о внешнеторговом контракте</div></xsl:if><xsl:apply-templates select="mprma:Contract" /><xsl:if test="mprma:AdditionalAgreement"><div class="title marg-top">Дополнительное соглашение к внешнеторговому контракту</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Наименование документа</td><td class="graphMain bordered">Номер документа</td><td class="graphMain bordered">Дата документа</td><td class="graphMain bordered">Номер приложения к контракту</td></tr><xsl:for-each select="mprma:AdditionalAgreement"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if><xsl:if test="mprma:CustomsOffice"><div class="title marg-top">Таможенный орган</div></xsl:if><xsl:apply-templates select="mprma:CustomsOffice" /><div class="title marg-top">Сведения о медицинских товарах, сырье или комплкектующих для производства медицинского товара</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Сведения о медицинском товаре</td><td class="graphMain bordered">Сведения о сырье и комплектующих для производства медицинского товара</td><td class="graphMain bordered">Наименование производителя</td><td class="graphMain bordered">Наименование страны производства</td><td class="graphMain bordered">Код страны производства</td><td class="graphMain bordered">Сведения о количестве и коде единицы измерения товара</td></tr><xsl:for-each select="mprma:Goods"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата начала действия</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mprma:DateBegin" /></xsl:call-template></td></tr></table><xsl:if test="mprma:DateEnd"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата окончания действия</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mprma:DateEnd" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="mprma:OtherDurationInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Иные сведения о сроке действия товаров</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:OtherDurationInfo" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Статус: 1 - подтверждение действует; 2 - Подтверждение аннулировано</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mprma:Status=1"><xsl:text>подтверждение действует</xsl:text></xsl:when><xsl:when test="mprma:Status=2"><xsl:text>Подтверждение аннулировано</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="mprma:Status" /></xsl:otherwise></xsl:choose></td></tr></table><xsl:if test="mprma:AnnulmentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата аннулирования подтверждения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mprma:AnnulmentDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="mprma:AuthorizedPerson"><div class="title marg-top">Уполномоченное лицо со стороны Минпромторга</div></xsl:if><xsl:apply-templates select="mprma:AuthorizedPerson" /></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
<xsl:template match="RUScat_ru:KGOrganizationFeatures">
<xsl:if test="cat_ru:KGINN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="cat_ru:KGINN=ИНН"><xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text></xsl:when><xsl:when test="cat_ru:KGINN=ПИН"><xsl:text>персональный идентификационный номер</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="cat_ru:KGINN" /></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="cat_ru:KGOKPO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KGOKPO" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
<xsl:template match="RUScat_ru:RAOrganizationFeatures">
<xsl:if test="cat_ru:UNN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:UNN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:SocialServiceNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:SocialServiceNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:SocialServiceCertificate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:SocialServiceCertificate" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
<xsl:template match="RUScat_ru:RBOrganizationFeatures">
<xsl:if test="cat_ru:UNP"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:UNP" /></td></tr></table></xsl:if><xsl:if test="cat_ru:RBIdentificationNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RBIdentificationNumber" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="RUScat_ru:RFOrganizationFeatures">
<xsl:if test="cat_ru:OGRN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OGRN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:INN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:INN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:KPP"><table class="w190"><tr><td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KPP" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
<xsl:template match="RUScat_ru:RKOrganizationFeatures">
<xsl:if test="cat_ru:BIN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:BIN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IIN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IIN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ITN"></xsl:if><xsl:if test="cat_ru:ITN"><div class="title marg-top">Идентификационный таможенный номер (ИТН)</div></xsl:if><xsl:apply-templates select="cat_ru:ITN" /></xsl:template>

<!-- Шаблон для типа cat_ru:ITNKZType -->
<xsl:template match="cat_ru:ITN">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CategoryCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KATOCode" /></td></tr></table><xsl:if test="cat_ru:RNN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RNN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ITNReserv"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Резерв для ИТН</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ITNReserv" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mprma:AdditionalAgreementType -->
<xsl:template match="mprma:AdditionalAgreement">
<tr><td class="graphMain bordered"><xsl:value-of select="cat_ru:PrDocumentName" /></td><td class="graphMain bordered"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td><td class="graphMain bordered"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td><td class="graphMain bordered"><xsl:value-of select="mprma:AdditionNum" /></td></tr></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUOrganizationNameAddrType -->
<xsl:template match="mprma:Applicant">
<xsl:if test="RUScat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td><td class="graphMain value" style="width:50%"><xsl:for-each select="RUScat_ru:OrganizationName"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="RUScat_ru:ShortName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование организации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:ShortName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OrganizationLanguage"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OrganizationLanguage" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:RFOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div></xsl:if><xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures" /><xsl:if test="RUScat_ru:RKOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div></xsl:if><xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures" /><xsl:if test="RUScat_ru:RBOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div></xsl:if><xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures" /><xsl:if test="RUScat_ru:RAOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Армения</div></xsl:if><xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures" /><xsl:if test="RUScat_ru:KGOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div></xsl:if><xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures" /><xsl:if test="RUScat_ru:Address"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Юридический адрес</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Address" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="mprma:AuthorizedPerson">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="mprma:Certification">
<xsl:if test="cat_ru:PrDocumentName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="mprma:Confirmation">
<xsl:if test="cat_ru:PrDocumentName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="mprma:Contract">
<xsl:if test="cat_ru:PrDocumentName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:CustomsType -->
<xsl:template match="mprma:CustomsOffice">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Код таможенного органа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Code" /></td></tr></table><xsl:if test="cat_ru:OfficeName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование таможенного органа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OfficeName" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mprma:GoodsType -->
<xsl:template match="mprma:Goods">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mprma:MedicalGoodInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="mprma:RawMaterialOrAccessoriesInfo" /></td><td class="graphMain bordered"><xsl:value-of select="mprma:Manufacturer" /></td><td class="graphMain bordered"><xsl:value-of select="mprma:CountryName" /></td><td class="graphMain bordered"><xsl:value-of select="mprma:CountryA3Code" /></td><td class="graphMain bordered"><xsl:apply-templates select="mprma:Quantity" /></td></tr></xsl:template>

<!-- Шаблон для типа mprma:MedicalGoodInfoType -->
<xsl:template match="mprma:MedicalGoodInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование медицинского товара</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:MedicalGoodName" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Марка</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Mark" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Модель</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Model" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Артикул</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:VendorCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сырье</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:RawMaterials" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Материалы</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Materials" /></td></tr></table><xsl:if test="mprma:OtherInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Иная характеристика</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:OtherInfo" /></td></tr></table></xsl:if><xsl:if test="mprma:Certification"><div class="title marg-top">Сведения о регистрационном удостоверении Росздравнадзора</div></xsl:if><xsl:apply-templates select="mprma:Certification" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер технических условий</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:TechnicalConditionsNum" /></td></tr></table></xsl:template>

<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
<xsl:template match="mprma:Quantity">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')" /></td></tr></table><xsl:if test="cat_ru:MeasureUnitQualifierName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:MeasureUnitQualifierName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:MeasureUnitQualifierCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:MeasureUnitQualifierCode" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mprma:RawMaterialOrAccessoriesInfo -->
<xsl:template match="mprma:RawMaterialOrAccessoriesInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование сырья и комплектующих изделий</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:RawMaterialOrAccessoriesName" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Назначение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Designation" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Стандарт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Standard" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Марка</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Mark" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Модель</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Model" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Артикул</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:VendorCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Тип</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Type" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:Series" /></td></tr></table><xsl:if test="mprma:OtherInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Иная характеристика</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mprma:OtherInfo" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUOrganizationNameAddrType -->
<xsl:template match="mprma:Receiver">
<xsl:if test="RUScat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td><td class="graphMain value" style="width:50%"><xsl:for-each select="RUScat_ru:OrganizationName"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="RUScat_ru:ShortName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование организации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:ShortName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OrganizationLanguage"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OrganizationLanguage" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:RFOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div></xsl:if><xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures" /><xsl:if test="RUScat_ru:RKOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div></xsl:if><xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures" /><xsl:if test="RUScat_ru:RBOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div></xsl:if><xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures" /><xsl:if test="RUScat_ru:RAOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Армения</div></xsl:if><xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures" /><xsl:if test="RUScat_ru:KGOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div></xsl:if><xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures" /><xsl:if test="RUScat_ru:Address"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Юридический адрес</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Address" /></td></tr></table></xsl:if></xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>