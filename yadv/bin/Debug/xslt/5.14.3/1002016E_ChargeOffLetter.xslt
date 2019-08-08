<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:chl="urn:customs.ru:Information:CommercialFinanceDocuments:ChargeOffLetter:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Письмо на списание денежных средств со счетов брокера</title>
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
               <xsl:apply-templates select="chl:ChargeOffLetter"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--Основной шаблон. Обрабатываем корневой элемент-->
   <xsl:template match="chl:ChargeOffLetter">
      <h1>Письмо на списание денежных средств со счетов брокера</h1>
      <h2>Реквизиты документа</h2>
      <xsl:apply-templates select="chl:DocumentReference"/>
      <h2>Предприятие-плательщик</h2>
      <xsl:apply-templates select="chl:Broker"/>
      <h2>За кого осуществляется платеж (декларант)</h2>
      <xsl:apply-templates select="chl:Declarant"/>
      <h2>Текст письма</h2>
      <p style="text-align: justify; text-indent: 20pt;">
         <xsl:apply-templates select="chl:LetterText"/>
      </p>
      <h2>Платежи</h2>
      <xsl:apply-templates select="chl:Payments"/>
      <h2>Подписи должностных лиц брокера</h2>
      <xsl:apply-templates select="chl:Signatures"/>
      <h2>Должностное лицо таможенного органа, на имя которого формируется письмо</h2>
      <xsl:apply-templates select="chl:CustomsPerson"/>
   </xsl:template>
   <!--Реквизиты документа-->
   <xsl:template match="chl:DocumentReference">
      <p>
         <b>Наименование документа: </b>
         <xsl:apply-templates select="cat_ru:PrDocumentName"/>
         <br/>
         <b>Номер: </b>
         <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
         <b>, дата: </b>
         <xsl:call-template name="DateRu">
            <xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
         </xsl:call-template>
      </p>
   </xsl:template>
   <!--Отображает предприятие с банковскими данными: Declarant или Broker-->
   <xsl:template match="chl:Broker | chl:Declarant">
      <p>
         <b>Наименование организации: </b>
         <xsl:apply-templates select="cat_ru:OrganizationName"/>
         <xsl:if test="cat_ru:ShortName">
            <br/>
            <b>Краткое наименование организации: </b>
            <xsl:apply-templates select="cat_ru:ShortName"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN | cat_ru:RFOrganizationFeatures/cat_ru:KPP |cat_ru:RFOrganizationFeatures/cat_ru:INN">
            <br/>
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN |cat_ru:RFOrganizationFeatures/cat_ru:KPP | cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
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
      <h3>Информация о банковских счетах</h3>
      <xsl:apply-templates select="cat_ru:BankInformation"/>
   </xsl:template>
   <xsl:template match="cat_ru:OGRN">
      <b>ОГРН: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:INN">
      <xsl:call-template name="CommaSeparator"/>
      <b>ИНН: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:KPP">
      <xsl:call-template name="CommaSeparator"/>
      <b>КПП: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Contact/cat_ru:Phone">
      <b>Номер телефона: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Contact/cat_ru:Fax">
      <xsl:call-template name="CommaSeparator"/>
      <b>Номер факса: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:Contact/cat_ru:Telex">
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
   <!--Информация о банковсвких счетах-->
   <xsl:template match="cat_ru:BankInformation">
      <p>
         <b>Название банка: </b>
         <xsl:apply-templates select="cat_ru:BankName"/>
         <xsl:if test="cat_ru:BankMFO | cat_ru:OKPOID | cat_ru:BICID | cat_ru:SWIFTID | cat_ru:CorrAccount">
            <br/>
            <xsl:apply-templates select="cat_ru:BankMFO | cat_ru:OKPOID | cat_ru:BICID | cat_ru:SWIFTID | cat_ru:CorrAccount"/>
         </xsl:if>
      </p>
      <xsl:if test="cat_ru:TransitCurrencyAccount">
         <p>
            <b>Валютные счета организации (транзитные):</b>
         </p>
         <ul>
            <xsl:for-each select="cat_ru:TransitCurrencyAccount">
               <li>
                  <xsl:value-of select="."/>
               </li>
            </xsl:for-each>
         </ul>
      </xsl:if>
      <xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
         <p>
            <b>Валютные счета организации (специальные транзитные):</b>
         </p>
         <ul>
            <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
               <li>
                  <xsl:value-of select="."/>
               </li>
            </xsl:for-each>
         </ul>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:BankMFO">
      <b>МФО: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:OKPOID">
      <xsl:call-template name="CommaSeparator"/>
      <b>ОКПО: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:BICID">
      <xsl:call-template name="CommaSeparator"/>
      <b>БИК: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:SWIFTID">
      <xsl:call-template name="CommaSeparator"/>
      <b>SWIFT: </b>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:CorrAccount">
      <xsl:call-template name="CommaSeparator"/>
      <b>Корр. счёт: </b>
      <xsl:value-of select="."/>
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
   <!--Платежи-->
   <xsl:template match="chl:Payments">
      <p>
         <b>Код вида платежа: </b>
         <xsl:value-of select="chl:PaymentModeCode"/>
         <b>, сумма: </b>
         <xsl:value-of select="chl:PaymentAmount"/>
         <b>. Платёжное поручение номер: </b>
         <xsl:value-of select="chl:PaymentOrderNumber"/>
         <b> от </b>
         <xsl:call-template name="DateRu">
            <xsl:with-param name="text" select="chl:PaymentOrderDate"/>
         </xsl:call-template>
      </p>
   </xsl:template>
   <!--Подписи-->
   <xsl:template match="chl:Signatures | chl:CustomsPerson">
      <p>
         <b>ФИО: </b>
         <xsl:value-of select="cat_ru:PersonSurname"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonMiddleName"/>
         <b>, должность: </b>
         <xsl:value-of select="cat_ru:PersonPost"/>
      </p>
   </xsl:template>
</xsl:stylesheet>
