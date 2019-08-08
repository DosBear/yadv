<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:ro_req="urn:customs.ru:Information:SQDocuments:MvdVehiclesRegActionsOwnersReq:5.13.3">
 <!-- Шаблон для типа MvdVehiclesRegActionsOwnersReqType -->
<xsl:template match="ro_req:MvdVehiclesRegActionsOwnersReq">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос сведений о регистрационных действиях транспортных средств и их владельцах</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="ro_req:VehicleInfo"><div class="title marg-top">Сведения о транспортном средстве</div></xsl:if><xsl:apply-templates select="ro_req:VehicleInfo" /><xsl:if test="ro_req:LegalOwnerInfo"><div class="title marg-top">Сведения о владельце (ЮЛ)</div></xsl:if><xsl:apply-templates select="ro_req:LegalOwnerInfo" /><xsl:if test="ro_req:PrivateOwnerInfo"><div class="title marg-top">Сведения о владельце (ФЛ)</div></xsl:if><xsl:apply-templates select="ro_req:PrivateOwnerInfo" /></div></body></html></xsl:template>

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

<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
<xsl:template match="ro_req:IdentityCard">
<xsl:if test="cat_ru:IdentityCardCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardSeries"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardSeries" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="cat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:IssuerCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:IssuerCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:FullIdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование вида документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:FullIdentityCardName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AuthorityId"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AuthorityId" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryCode" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUOrganizationBaseType -->
<xsl:template match="ro_req:LegalOwnerInfo">
<xsl:if test="RUScat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td><td class="graphMain value" style="width:50%"><xsl:for-each select="RUScat_ru:OrganizationName"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="RUScat_ru:ShortName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование организации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:ShortName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OrganizationLanguage"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OrganizationLanguage" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:RFOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div></xsl:if><xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures" /><xsl:if test="RUScat_ru:RKOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div></xsl:if><xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures" /><xsl:if test="RUScat_ru:RBOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div></xsl:if><xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures" /><xsl:if test="RUScat_ru:RAOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Армения</div></xsl:if><xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures" /><xsl:if test="RUScat_ru:KGOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div></xsl:if><xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures" /></xsl:template>

<!-- Шаблон для типа cat_ru:TransportMeansPassportType -->
<xsl:template match="ro_req:PTS">
<xsl:if test="cat_ru:Series"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия Паспорта транспортного средства</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Series" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер Паспорта транспортного средства</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PTSNumber" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RegionCode" /></td></tr></table></xsl:template>

<!-- Шаблон для типа ro_req:PrivateOwnerInfoType -->
<xsl:template match="ro_req:PrivateOwnerInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ro_req:BirthDate" /></xsl:call-template></td></tr></table><xsl:if test="ro_req:INN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ИНН</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ro_req:INN" /></td></tr></table></xsl:if><xsl:if test="ro_req:IdentityCard"></xsl:if><xsl:if test="ro_req:IdentityCard"><div class="title marg-top">Документ, удостоверяющий личность</div></xsl:if><xsl:apply-templates select="ro_req:IdentityCard" /></xsl:template>

<!-- Шаблон для типа ro_req:VehicleInfoType -->
<xsl:template match="ro_req:VehicleInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Марка, модель</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Model" /></td></tr></table><xsl:if test="cat_ru:Mark"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование марки транспортного средства в соответствии с классификатором марок дорожных транспортных средств</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Mark" /></td></tr></table></xsl:if><xsl:if test="cat_ru:MarkCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код марки транспортного средства в соответствии с классификатором марок дорожных транспортных средств</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:MarkCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:OfftakeYear"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Год изготовления транспортного средства</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OfftakeYear" /></td></tr></table></xsl:if><xsl:if test="cat_ru:EngineVolumeQuanity"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Рабочий объем двигателя, куб. см</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(cat_ru:EngineVolumeQuanity, '.', ',')" /></td></tr></table></xsl:if><xsl:if test="cat_ru:VINID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер (VIN)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:VINID" /></td></tr></table></xsl:if><xsl:if test="cat_ru:BodyID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер кузова (прицепа), присвоенный и нанесенный на него организацией-изготовителем</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:BodyID" /></td></tr></table></xsl:if><xsl:if test="cat_ru:EngineID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Присвоенный организацией - изготовителем идентификационный номер двигателя, нанесенный на блоке двигателя. Идентификационный номер может состоять из групп раздельных цифр, из которых последняя группа, состоящая из двух цифр, указывает год выпуска двигателя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:EngineID" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ChassisID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер шасси (рамы), присвоенные и нанесенные на них организацией-изготовителем</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ChassisID" /></td></tr></table></xsl:if><xsl:if test="cat_ru:CabID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер кабины</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CabID" /></td></tr></table></xsl:if><xsl:if test="cat_ru:EmergencyDeviceID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер устройства или системы вызова экстренных оперативных служб, которыми оборудовано транспортное средство. Для РФ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:EmergencyDeviceID" /></td></tr></table></xsl:if><xsl:if test="ro_req:PTS"></xsl:if><xsl:if test="ro_req:PTS"><div class="title marg-top">Серия и номер текущего ПТС или первичного ПТС</div></xsl:if><xsl:apply-templates select="ro_req:PTS" /><xsl:if test="ro_req:RegistrationPlate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Государственный регистрационный знак</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ro_req:RegistrationPlate" /></td></tr></table></xsl:if></xsl:template>

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