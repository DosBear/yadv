<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mav_req="urn:customs.ru:Information:SQDocuments:MvdAdmViolationRequest:5.13.2">
 <!-- Шаблон для типа MvdAdmViolationRequestType -->
<xsl:template match="mav_req:MvdAdmViolationRequest">
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
									max-width: 100%;
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

									div.title, tr.title td 
									{ font-weight:bold;  }
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
								</style></head><body><div class="page"><table><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Передача сведений об административных правонарушениях (Запрос)</b></font></td></tr></tbody></table><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Идентификатор записи. Должен сохраняться при всех последующих действиях с записью</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:id" /></td></tr></table><xsl:if test="mav_req:createdAtRegion"></xsl:if><xsl:if test="mav_req:createdAtRegion"><div class="title marg-top">Территориальный орган, создавший дело. Словарь «Регион инициатор постановки на учет»</div></xsl:if><xsl:apply-templates select="mav_req:createdAtRegion" /><xsl:if test="mav_req:ownerRegion"></xsl:if><xsl:if test="mav_req:ownerRegion"><div class="title marg-top">Текущий территориальный орган. Словарь «Регион инициатор постановки на учет»</div></xsl:if><xsl:apply-templates select="mav_req:ownerRegion" /><table><tr><td class="annot graphMain" style="width:50%">Номер дела</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:case" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Дата создания записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:createdAt" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Дата обновления записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:updatedAt" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Дата заполнения карточки</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mav_req:writtenAt" /></xsl:call-template></td></tr></table><div class="title marg-top">Постановление</div><table class="bordered w190"><tbody><tr class="title" /><xsl:for-each select="mav_req:restriction"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table><xsl:if test="mav_req:offenceInfo"><div class="title marg-top">Сведения о правонарушении</div></xsl:if><xsl:apply-templates select="mav_req:offenceInfo" /><xsl:if test="mav_req:offender"><div class="title marg-top">Лицо, совершившее административное правонарушение</div></xsl:if><xsl:apply-templates select="mav_req:offender" /><xsl:if test="mav_req:regionCode"><div class="title marg-top">Регион инициатор постановки на учет</div></xsl:if><xsl:apply-templates select="mav_req:regionCode" /><xsl:if test="mav_req:archive"><div class="title marg-top">Статус документа: активный или архив</div></xsl:if><xsl:apply-templates select="mav_req:archive" /></div></body></html></xsl:template>

<!-- Шаблон для типа mav_req:FullAddressType -->
<xsl:template match="mav_req:address">
<xsl:if test="mav_req:cityAddress"><div class="title marg-top">Страна, регион, район, город</div></xsl:if><xsl:apply-templates select="mav_req:cityAddress" /><xsl:if test="mav_req:cityArea"></xsl:if><xsl:if test="mav_req:cityArea"><div class="title marg-top">Внутригородская территория / Микрорайон</div></xsl:if><xsl:apply-templates select="mav_req:cityArea" /><xsl:if test="mav_req:street"></xsl:if><xsl:if test="mav_req:street"><div class="title marg-top">Улица</div></xsl:if><xsl:apply-templates select="mav_req:street" /><xsl:if test="mav_req:house"></xsl:if><xsl:if test="mav_req:house"><div class="title marg-top">Дом</div></xsl:if><xsl:apply-templates select="mav_req:house" /><xsl:if test="mav_req:building"></xsl:if><xsl:if test="mav_req:building"><div class="title marg-top">Корпус</div></xsl:if><xsl:apply-templates select="mav_req:building" /><xsl:if test="mav_req:construction"></xsl:if><xsl:if test="mav_req:construction"><div class="title marg-top">Строение</div></xsl:if><xsl:apply-templates select="mav_req:construction" /><xsl:if test="mav_req:appartment"><table><tr><td class="annot graphMain" style="width:50%">Квартира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:appartment" /></td></tr></table></xsl:if><xsl:if test="mav_req:postalCode"><table><tr><td class="annot graphMain" style="width:50%">Код почтового отделения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:postalCode" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mav_req:ConditionType -->
<xsl:template match="mav_req:archive">
	<table>
		<tr>
			<td class="annot graphMain" style="width:50%">Принадлежность архиву: true — если документ в архиве, false — если документ в основном учете</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="mav_req:inArchive='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</table>
	<xsl:if test="mav_req:reason"></xsl:if>
	<xsl:if test="mav_req:reason">
		<div class="title marg-top">Значение из словаря «Основание для переноса в архив».<br/>
		В случае, если запись была удалена на стороне сервиса–поставщика сведений,<br/>в ИБД-М отправляется обновление записи, значение поля «Запись удалена»</div>
	</xsl:if>
	<xsl:apply-templates select="mav_req:reason" />
	<xsl:if test="mav_req:archiveDate">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата переноса записи в архив</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mav_req:archiveDate" />
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:area">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:CodexArticleType -->
<xsl:template match="mav_req:article">
<xsl:if test="mav_req:codexType"><div class="title marg-top">Вид кодекса. Словарь «Вид кодекса»</div></xsl:if><xsl:apply-templates select="mav_req:codexType" /><table><tr><td class="annot graphMain" style="width:50%">Название кодекса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:codexTitle" /></td></tr></table><xsl:if test="mav_req:countryIssued"><div class="title marg-top">Страна, выпустившая кодекс. Словарь «Страна рождения»</div></xsl:if><xsl:apply-templates select="mav_req:countryIssued" /><xsl:if test="mav_req:edition"><table><tr><td class="annot graphMain" style="width:50%">Редакция кодекса, дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mav_req:edition" /></xsl:call-template></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Наименование статьи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:offenceArticle" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Статья номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:articleNum" /></td></tr></table><xsl:if test="mav_req:articleNote"><table><tr><td class="annot graphMain" style="width:50%">Статья примечание</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:articleNote" /></td></tr></table></xsl:if><xsl:if test="mav_req:articlePart"><table><tr><td class="annot graphMain" style="width:50%">Статья часть</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:articlePart" /></td></tr></table></xsl:if><xsl:if test="mav_req:articleParagraph"><table><tr><td class="annot graphMain" style="width:50%">Статья пункт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:articleParagraph" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:building">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:city">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:CityAddressType -->
<xsl:template match="mav_req:cityAddress">
<xsl:if test="mav_req:country"><div class="title marg-top">Страна. Словарь «Страна рождения»</div></xsl:if><xsl:apply-templates select="mav_req:country" /><xsl:if test="mav_req:region"><div class="title marg-top">Регион. Словарь «Регион регистрации иностранного гражданина»</div></xsl:if><xsl:apply-templates select="mav_req:region" /><xsl:if test="mav_req:area"></xsl:if><xsl:if test="mav_req:area"><div class="title marg-top">Автономный округ</div></xsl:if><xsl:apply-templates select="mav_req:area" /><xsl:if test="mav_req:district"></xsl:if><xsl:if test="mav_req:district"><div class="title marg-top">Район</div></xsl:if><xsl:apply-templates select="mav_req:district" /><xsl:if test="mav_req:city"></xsl:if><xsl:if test="mav_req:city"><div class="title marg-top">Город</div></xsl:if><xsl:apply-templates select="mav_req:city" /><xsl:if test="mav_req:okato"><table><tr><td class="annot graphMain" style="width:50%">Код ОКАТО</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:okato" /></td></tr></table></xsl:if><xsl:if test="mav_req:latitude"><table><tr><td class="annot graphMain" style="width:50%">Широта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(mav_req:latitude, '.', ',')" /></td></tr></table></xsl:if><xsl:if test="mav_req:longitude"><table><tr><td class="annot graphMain" style="width:50%">Долгота</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(mav_req:longitude, '.', ',')" /></td></tr></table></xsl:if><xsl:if test="mav_req:kladr"><table><tr><td class="annot graphMain" style="width:50%">Код КЛАДР</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:kladr" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:cityArea">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:codexType">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:construction">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:country">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:countryIssued">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:createdAtRegion">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:district">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:house">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:OffenceInfoType -->
<xsl:template match="mav_req:offenceInfo">
<table><tr><td class="annot graphMain" style="width:50%">Идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:id" /></td></tr></table><xsl:if test="mav_req:offenceKind"><div class="title marg-top">Характер правонарушения. Словарь «Характер нарушения»</div></xsl:if><xsl:apply-templates select="mav_req:offenceKind" /><xsl:if test="mav_req:article"><div class="title marg-top">Статья</div></xsl:if><xsl:apply-templates select="mav_req:article" /><xsl:if test="mav_req:address"><div class="title marg-top">Адрес совершения</div></xsl:if><xsl:apply-templates select="mav_req:address" /><table><tr><td class="annot graphMain" style="width:50%">Дата совершения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mav_req:date" /></xsl:call-template></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Время совершения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="substring(mav_req:time, 1,8)" /></td></tr></table><xsl:if test="mav_req:alcoholicIntoxicationDetection"><table><tr><td class="annot graphMain" style="width:50%">Направлен на медицинское освидетельствование</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mav_req:alcoholicIntoxicationDetection='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="mav_req:alcoholicIntoxication"><table><tr><td class="annot graphMain" style="width:50%">Алкогольное опьянение</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mav_req:alcoholicIntoxication='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="mav_req:drugIntoxication"><table><tr><td class="annot graphMain" style="width:50%">Наркотическое опьянение</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mav_req:drugIntoxication='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="mav_req:intoxicatedWith"><table><tr><td class="annot graphMain" style="width:50%">Тип наркотического вещества</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:intoxicatedWith" /></td></tr></table></xsl:if><xsl:if test="mav_req:fan"><table><tr><td class="annot graphMain" style="width:50%">Фанатская статья</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mav_req:fan='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table></xsl:if><xsl:if test="mav_req:additionalText"><table><tr><td class="annot graphMain" style="width:50%">Дополнительная информация</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:additionalText" /></td></tr></table></xsl:if><xsl:if test="mav_req:vehicle"></xsl:if><xsl:if test="mav_req:vehicle"><div class="title marg-top">Сведения об АМТ, если необходимо</div></xsl:if><xsl:apply-templates select="mav_req:vehicle" /></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:offenceKind">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:OffenderType -->
<xsl:template match="mav_req:offender">
</xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:ownerRegion">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:reason">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:region">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:regionCode">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:RestrictionType -->
<xsl:template match="mav_req:restriction">
<tr></tr></xsl:template>

<!-- Шаблон для типа mav_req:AddressObjectType -->
<xsl:template match="mav_req:street">
<xsl:if test="mav_req:code"><table><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор записи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Краткое наименование типа объекта</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:shortName" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Официальное наименование</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:VehicleDataType -->
<xsl:template match="mav_req:vehicle">
<table><tr><td class="annot graphMain" style="width:50%">Государственный регистрационный номер АМТ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:vehicleNumber" /></td></tr></table><xsl:if test="mav_req:vehicleNumberRegion"><div class="title marg-top">Регион регистрации АМТ</div></xsl:if><xsl:apply-templates select="mav_req:vehicleNumberRegion" /><xsl:if test="mav_req:vehicleBrand"><div class="title marg-top">Марка АМТ</div></xsl:if><xsl:apply-templates select="mav_req:vehicleBrand" /><xsl:if test="mav_req:vehicleModel"><table><tr><td class="annot graphMain" style="width:50%">Модель АМТ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:vehicleModel" /></td></tr></table></xsl:if><xsl:if test="mav_req:vehicleOwner"><div class="title marg-top">Лицо, на которое зарегистрировано АМТ</div></xsl:if><xsl:apply-templates select="mav_req:vehicleOwner" /></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:vehicleBrand">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:ClassifierValueType -->
<xsl:template match="mav_req:vehicleNumberRegion">
<table><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:code" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mav_req:PersonalNameType -->
<xsl:template match="mav_req:vehicleOwner">
<table><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if><xsl:if test="mav_req:id"><table><tr><td class="annot graphMain" style="width:50%">Идентификатор лица</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:id" /></td></tr></table></xsl:if><xsl:if test="mav_req:created_at"><table><tr><td class="annot graphMain" style="width:50%">Дата создания записи в БД</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:created_at" /></td></tr></table></xsl:if><xsl:if test="mav_req:updated_at"><table><tr><td class="annot graphMain" style="width:50%">Дата обновления записи в БД</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mav_req:updated_at" /></td></tr></table></xsl:if></xsl:template>

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