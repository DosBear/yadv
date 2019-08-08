<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:par="urn:customs.ru:Information:ExchangeDocuments:PaymentResult:5.13.3" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа PaymentResultType -->
<xsl:template match="par:PaymentResult">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Результат списания/резервирования платежей</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="par:DocType"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Тип документа: 0 - результат резевирования платежей по квитанции к МПО, 1 - результат списания платежей по квитанции к МПО</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="par:DocType=0"><xsl:text>результат резевирования платежей по квитанции к МПО</xsl:text></xsl:when><xsl:when test="par:DocType=1"><xsl:text>результат списания платежей по квитанции к МПО</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="par:DocType" /></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="par:OperationID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный код операции</td><td class="value graphMain" style="width:50%"><xsl:value-of select="par:OperationID" /></td></tr></table></xsl:if><xsl:if test="par:CustomsPost"></xsl:if><xsl:if test="par:CustomsPost"><div class="title marg-top">Таможенный пост оформления</div></xsl:if><xsl:apply-templates select="par:CustomsPost" /><xsl:if test="par:MPO_Registration"><div class="title marg-top">Справочний номер квитанции</div></xsl:if><xsl:apply-templates select="par:MPO_Registration" /><xsl:if test="par:MPO_ID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ID МПО / уникальный номер записи в реестре МПО</td><td class="value graphMain" style="width:50%"><xsl:value-of select="par:MPO_ID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Общая сумма подлежащих к уплате/резевированию платежей</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(par:Amount, '.', ',')" /></td></tr></table><xsl:if test="par:CurrencyRate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код валюты платежа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="par:CurrencyRate" /></td></tr></table></xsl:if><xsl:if test="par:AuthorizedOperator"></xsl:if><xsl:if test="par:AuthorizedOperator"><div class="title marg-top">Уполномоченный оператор</div></xsl:if><xsl:apply-templates select="par:AuthorizedOperator" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Признак успеха операции</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="par:Result='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table><xsl:if test="par:ErrorCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код ошибки</td><td class="value graphMain" style="width:50%"><xsl:value-of select="par:ErrorCode" /></td></tr></table></xsl:if><xsl:if test="par:ErrorDescription"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Описание ошибки</td><td class="value graphMain" style="width:50%"><xsl:value-of select="par:ErrorDescription" /></td></tr></table></xsl:if></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:AddressType -->
<xsl:template match="cat_ru:Address">
<xsl:if test="cat_ru:PostalCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Почтовый индекс</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PostalCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CountryCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:CounryName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CounryName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:Region"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Region" /></td></tr></table></xsl:if><xsl:if test="cat_ru:City"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Населенный пункт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:City" /></td></tr></table></xsl:if><xsl:if test="cat_ru:StreetHouse"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:StreetHouse" /></td></tr></table></xsl:if><xsl:if test="cat_ru:TerritoryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TerritoryCode" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:ContactType -->
<xsl:template match="cat_ru:Contact">
<xsl:if test="cat_ru:Phone"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер телефона</td><td class="graphMain value" style="width:50%"><xsl:for-each select="cat_ru:Phone"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="cat_ru:Fax"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер факса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Fax" /></td></tr></table></xsl:if><xsl:if test="cat_ru:Telex"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер телекса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Telex" /></td></tr></table></xsl:if><xsl:if test="cat_ru:E_mail"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Адрес электронной почты</td><td class="graphMain value" style="width:50%"><xsl:for-each select="cat_ru:E_mail"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:ITNKZType -->
<xsl:template match="cat_ru:ITN">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CategoryCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KATOCode" /></td></tr></table><xsl:if test="cat_ru:RNN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RNN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ITNReserv"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Резерв для ИТН</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ITNReserv" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:IdentityCardType -->
<xsl:template match="cat_ru:IdentityCard">
<xsl:if test="cat_ru:IdentityCardCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardSeries"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardSeries" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="cat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
<xsl:if test="cat_ru:KGINN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="cat_ru:KGINN=ИНН"><xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text></xsl:when><xsl:when test="cat_ru:KGINN=ПИН"><xsl:text>персональный идентификационный номер</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="cat_ru:KGINN" /></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="cat_ru:KGOKPO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KGOKPO" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
<xsl:if test="cat_ru:UNN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:UNN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:SocialServiceNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:SocialServiceNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:SocialServiceCertificate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:SocialServiceCertificate" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
<xsl:if test="cat_ru:UNP"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:UNP" /></td></tr></table></xsl:if><xsl:if test="cat_ru:RBIdentificationNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RBIdentificationNumber" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
<xsl:if test="cat_ru:OGRN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OGRN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:INN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:INN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:KPP"><table class="w190"><tr><td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KPP" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
<xsl:if test="cat_ru:BIN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:BIN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IIN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IIN" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ITN"></xsl:if><xsl:if test="cat_ru:ITN"><div class="title marg-top">Идентификационный таможенный номер (ИТН)</div></xsl:if><xsl:apply-templates select="cat_ru:ITN" /></xsl:template>

<!-- Шаблон для типа mpco:AuthorizedOperatorType -->
<xsl:template match="par:AuthorizedOperator">
<xsl:if test="cat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:ShortName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование организации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ShortName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:OrganizationLanguage"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage" /></td></tr></table></xsl:if><xsl:if test="cat_ru:RFOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div></xsl:if><xsl:apply-templates select="cat_ru:RFOrganizationFeatures" /><xsl:if test="cat_ru:RKOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div></xsl:if><xsl:apply-templates select="cat_ru:RKOrganizationFeatures" /><xsl:if test="cat_ru:RBOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div></xsl:if><xsl:apply-templates select="cat_ru:RBOrganizationFeatures" /><xsl:if test="cat_ru:RAOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Республики Армения</div></xsl:if><xsl:apply-templates select="cat_ru:RAOrganizationFeatures" /><xsl:if test="cat_ru:KGOrganizationFeatures"><div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div></xsl:if><xsl:apply-templates select="cat_ru:KGOrganizationFeatures" /><xsl:if test="cat_ru:Address"></xsl:if><xsl:if test="cat_ru:Address"><div class="title marg-top">Адрес организации</div></xsl:if><xsl:apply-templates select="cat_ru:Address" /><xsl:if test="cat_ru:IdentityCard"></xsl:if><xsl:if test="cat_ru:IdentityCard"><div class="title marg-top">Документ, удостоверяющий личность</div></xsl:if><xsl:apply-templates select="cat_ru:IdentityCard" /><xsl:if test="cat_ru:Contact"></xsl:if><xsl:if test="cat_ru:Contact"><div class="title marg-top">Контактная информация</div></xsl:if><xsl:apply-templates select="cat_ru:Contact" /><xsl:if test="mpco:OKPO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">ОКПО</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mpco:OKPO" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:CustomsType -->
<xsl:template match="par:CustomsPost">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Код таможенного органа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Code" /></td></tr></table><xsl:if test="cat_ru:OfficeName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование таможенного органа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OfficeName" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mpco:MPO_RegistrationType -->
<xsl:template match="par:MPO_Registration">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mpco:CustomsCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата регистрации документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpco:RegistrationDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный номер МПО</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mpco:MPO_Number" /></td></tr></table></xsl:template>

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