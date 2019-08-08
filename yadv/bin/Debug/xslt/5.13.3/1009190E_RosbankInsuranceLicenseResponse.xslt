<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:ril="urn:customs.ru:Information:SQDocuments:RosbankInsuranceLicenseResponse:5.13.3">
 <!-- Шаблон для типа RosbankInsuranceLicenseResponseType -->
<xsl:template match="ril:RosbankInsuranceLicenseResponse">
<html><head><style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 190mm;
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос сведений (из ЕГРССД), подтверждающих выдачу лицензии страховой организации на осуществление страхования (с приложением перечня правил страхования), заключившей договор страхования риска гражданской ответственности с заявителем-юридическим лицом, подавшим заявление на включение в реестр таможенных представителей (ответ)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="ril:LicenseInfo"><div class="title marg-top">Описание лицензий на осуществление страхования и видов страхования</div></xsl:if><xsl:apply-templates select="ril:LicenseInfo" /></div></body></html></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template match="RUScat_ru:Address">
<xsl:if test="RUScat_ru:AddressKindCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressKindCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:PostalCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Почтовый индекс</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostalCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CounryName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CounryName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Region"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Region" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:District"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:District" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Town"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Город</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Town" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:City"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Населенный пункт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:City" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:StreetHouse"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:StreetHouse" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:House"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:House" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Room"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Room" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AddressText"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressText" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OKTMO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKTMO" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OKATO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKATO" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:KLADR"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код КЛАДР</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:KLADR" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AOGUID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOGUID" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AOID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOID" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:TerritoryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:TerritoryCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:PostOfficeBoxId"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:ContactType -->
<xsl:template match="RUScat_ru:Contact">
<xsl:if test="cat_ru:Phone"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер телефона</td><td class="graphMain value" style="width:50%"><xsl:for-each select="cat_ru:Phone"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="cat_ru:Fax"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер факса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Fax" /></td></tr></table></xsl:if><xsl:if test="cat_ru:Telex"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер телекса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Telex" /></td></tr></table></xsl:if><xsl:if test="cat_ru:E_mail"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Адрес электронной почты</td><td class="graphMain value" style="width:50%"><xsl:for-each select="cat_ru:E_mail"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
<xsl:template match="RUScat_ru:IdentityCard">
<xsl:if test="cat_ru:IdentityCardCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardSeries"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardSeries" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="cat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:IssuerCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:IssuerCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:FullIdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование вида документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:FullIdentityCardName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AuthorityId"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AuthorityId" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryCode" /></td></tr></table></xsl:if></xsl:template>

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

<!-- Шаблон для типа ril:InsuranceInfoType -->
<xsl:template match="ril:InsuranceInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия, номер лицензии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:LicenseSeriesAndNumber" /></td></tr></table><xsl:if test="ril:LicenseOwnerInfo"><div class="title marg-top">Описание юридического лица, на которое оформлена лицензия</div></xsl:if><xsl:apply-templates select="ril:LicenseOwnerInfo" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Регистрационный номер по единому государственному реестру субъектов страхового дела</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:RegNumber" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата регистрации</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ril:RegDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование органа, выдавшего лицензию</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:IssueOrganization" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Состояние лицензии на осуществление страхования: "Действует"; "Приостановлена"; "Отозвана"</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:LicenseState" /></td></tr></table></xsl:template>

<!-- Шаблон для типа ril:InsuranceTypeInfoType -->
<xsl:template match="ril:InsuranceTypeInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование вида страхования</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:InsuranceType" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование правил страхования</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:InsuranceRules" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата и номер уведомительного письма о направлении правил страхования в орган страхового надзора</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ril:LetterDateAndNumber" /></td></tr></table></xsl:template>

<!-- Шаблон для типа ril:LicenseInfoType -->
<xsl:template match="ril:LicenseInfo">
<xsl:if test="ril:InsuranceInfo"><div class="title marg-top">Описание лицензии страховой организации на осуществление страхования</div></xsl:if><xsl:apply-templates select="ril:InsuranceInfo" /><xsl:if test="ril:InsuranceTypeInfo"><div class="title marg-top">Описание лицензии страховой организации по видам страхования</div></xsl:if><xsl:apply-templates select="ril:InsuranceTypeInfo" /></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUOrganizationType -->
<xsl:template match="ril:LicenseOwnerInfo">
<xsl:if test="RUScat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td><td class="graphMain value" style="width:50%"><xsl:for-each select="RUScat_ru:OrganizationName"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="RUScat_ru:ShortName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование организации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:ShortName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OrganizationLanguage"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OrganizationLanguage" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:RFOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div></xsl:if><xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures" /><xsl:if test="RUScat_ru:RKOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div></xsl:if><xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures" /><xsl:if test="RUScat_ru:RBOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div></xsl:if><xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures" /><xsl:if test="RUScat_ru:RAOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Армения</div></xsl:if><xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures" /><xsl:if test="RUScat_ru:KGOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div></xsl:if><xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures" /><xsl:if test="RUScat_ru:Address"></xsl:if><xsl:if test="RUScat_ru:Address"><div class="title marg-top">Адрес организации</div></xsl:if><xsl:apply-templates select="RUScat_ru:Address" /><xsl:if test="RUScat_ru:IdentityCard"></xsl:if><xsl:if test="RUScat_ru:IdentityCard"><div class="title marg-top">Документ, удостоверяющий личность</div></xsl:if><xsl:apply-templates select="RUScat_ru:IdentityCard" /><xsl:if test="RUScat_ru:Contact"></xsl:if><xsl:if test="RUScat_ru:Contact"><div class="title marg-top">Контактная информация</div></xsl:if><xsl:apply-templates select="RUScat_ru:Contact" /><xsl:if test="RUScat_ru:OrganizationFullDatas"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Полные данные по организации одной строкой (при отсутствии детализации)</td><td class="graphMain value" style="width:50%"><xsl:for-each select="RUScat_ru:OrganizationFullDatas"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if></xsl:template>

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