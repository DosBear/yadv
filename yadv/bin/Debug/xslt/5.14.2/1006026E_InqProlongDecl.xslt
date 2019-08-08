<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ipd="urn:customs.ru:Information:CustomsDocuments:InqProlongDecl:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>
               <xsl:choose>
                  <xsl:when test="ipd:InqProlongDecl/ipd:DocSign='0'">Заявление на продление срока подачи декларации</xsl:when>
                  <xsl:otherwise>Запрос о возможности переноса срока проведения операций</xsl:otherwise>
               </xsl:choose>
            </title>
            <style type="text/css">
                    body {background-color: #cccccc;}

                    div.page {
                        width: 210mm;
                        margin: 6pt auto;
                        padding: 10mm;
                        background: white;
                        border: solid 1px black;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none;}}

                    h1 {
                        text-align: center;
                        font-size: 16pt;
                        margin-bottom: 10pt;
                    }

                    h2 {font-size: 14pt; text-align: center;}

                    h3 {font-size: 12pt; text-align: center;}
                </style>
         </head>
         <body>
            <div class="page">
               <!--<xsl:choose>
					<xsl:when test="ipd:DocSign='0' or ipd:DocSign='false' or ipd:DocSign='f'"><xsl:apply-templates select="ipd:InqProlongDecl[ipd:DocSign='0' or ipd:DocSign='false' or ipd:DocSign='f']"/></xsl:when>
					<xsl:otherwise><xsl:apply-templates select="ipd:InqProlongDecl[ipd:DocSign='0' or ipd:DocSign='false' or ipd:DocSign='f']"/></xsl:otherwise>
				</xsl:choose>-->
			   <xsl:choose>
					<xsl:when test="ipd:InqProlongDecl/ipd:DocSign='0'">
						<xsl:apply-templates select="ipd:InqProlongDecl[ipd:DocSign='0']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="ipd:InqProlongDecl[ipd:DocSign='1']"/>
					</xsl:otherwise>
               </xsl:choose>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--Основной шаблон. Обрабатываем корневой элемент-->
   <xsl:template match="ipd:InqProlongDecl[ipd:DocSign='0']">
      <h1>Заявление на продление срока подачи декларации</h1>
      <h2>Реквизиты документа</h2>
      <xsl:call-template name="DocumentReference"/>
      <h2>Причины, по которым декларация не может быть подана в срок</h2>
      <ul>
         <xsl:apply-templates select="ipd:Reason"/>
      </ul>
      <h2>Сведения о заявителе</h2>
      <xsl:apply-templates select="ipd:Applicant"/>
   </xsl:template>
   <!--Реквизиты документа-->
   <xsl:template name="DocumentReference">
      <p>
         <b>Дата и время направления: </b>
         <xsl:call-template name="DateRu">
            <xsl:with-param name="text" select="ipd:SendDate"/>
         </xsl:call-template>
         <xsl:text> </xsl:text>
         <xsl:value-of select="ipd:SendTime"/>
         <br/>
         <b>Предлагаемая дата: </b>
         <xsl:call-template name="DateRu">
            <xsl:with-param name="text" select="ipd:SuggDate"/>
         </xsl:call-template>
      </p>
   </xsl:template>
   <!--Отображает предприятие-->
   <xsl:template match="ipd:Applicant">
      <p>
         <b>Наименование организации: </b>
         <xsl:apply-templates select="cat_ru:OrganizationName"/>
         <xsl:if test="cat_ru:ShortName">
            <br/>
            <b>Краткое наименование организации: </b>
            <xsl:apply-templates select="cat_ru:ShortName"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN | cat_ru:RFOrganizationFeatures/cat_ru:KPP | cat_ru:RFOrganizationFeatures/cat_ru:INN">
            <br/>
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN | cat_ru:RFOrganizationFeatures/cat_ru:KPP | cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         </xsl:if>
         <xsl:if test="cat_ru:Contact/cat_ru:Phone | cat_ru:Contact/cat_ru:Fax | cat_ru:Contact/cat_ru:Telex">
            <br/>
            <xsl:apply-templates select="cat_ru:Contact/cat_ru:Phone | cat_ru:Contact/cat_ru:Fax | cat_ru:Contact/cat_ru:Telex"/>
         </xsl:if>
         <xsl:if test="cat_ru:OKPOID | cat_ru:OKATOCode">
            <br/>
            <xsl:apply-templates select="cat_ru:OKPOID | cat_ru:OKATOCode"/>
         </xsl:if>
         <xsl:if test="cat_ru:Address">
            <br/>
            <b>Адрес: </b>
            <xsl:for-each select="cat_ru:Address/*">
               <xsl:if test="position() > 1">
                  <xsl:text>, </xsl:text>
               </xsl:if>
               <xsl:value-of select="."/>
            </xsl:for-each>
         </xsl:if>
      </p>
   </xsl:template>
   <!-- Причины -->
   <xsl:template match="ipd:Reason">
      <li>
         <xsl:value-of select="ipd:ReasonDescription"/>
      </li>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
      <b>ОГРН: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures/cat_ru:INN">
      <xsl:call-template name="CommaSeparator"/>
      <b>ИНН: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
      <xsl:call-template name="CommaSeparator"/>
      <b>КПП: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Phone">
      <b>Номер телефона: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Fax">
      <xsl:call-template name="CommaSeparator"/>
      <b>Номер факса: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Telex">
      <xsl:call-template name="CommaSeparator"/>
      <b>Номер телекса: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:OKPOID">
      <xsl:call-template name="CommaSeparator"/>
      <b>ОКПО: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:OKATOCode">
      <xsl:call-template name="CommaSeparator"/>
      <b>ОКАТО: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <!--Добавляем пробел и запятую, если в этой строке уже были выведены другие элементы-->
   <xsl:template name="CommaSeparator">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
   </xsl:template>
   <!--Дата по стандарту русской локали-->
   <xsl:template name="DateRu">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <!--Текст для разбора даты имеет верный формат - разбираем посимвольно-->
            <xsl:value-of select="substring($text, 9, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 6, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 1, 4)"/>
            <xsl:text> г.</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <!--Текст для разбора даты имеет неверный формат - выводим текст в исходном виде-->
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="ipd:InqProlongDecl[ipd:DocSign='1']">
      <h1>Запрос о возможности переноса срока проведения операций</h1>
      <!--<h2>Реквизиты документа</h2>-->
      <xsl:call-template name="DocumentReference"/>
      <h2>Причина:</h2>
      <xsl:for-each select="ipd:Reason">
         <xsl:value-of select="ipd:ReasonDescription"/> </xsl:for-each>
      <h2>Сведения о заявителе</h2>
      <xsl:apply-templates select="ipd:Applicant"/>
   </xsl:template>
</xsl:stylesheet>
