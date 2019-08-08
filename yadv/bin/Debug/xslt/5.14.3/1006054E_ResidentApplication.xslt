<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ra="urn:customs.ru:Information:CustomsDocuments:ResidentApplication:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Заявление резидента особой экономической зоны</title>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }
                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }
                    div.pageAlbum {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }
                    table.items {
                        border: none;
                        border-collapse: collapse;
                        emptyCells: show;
                        font-family: Arial;
                        font-size: 8pt;
                    }
                    .items th {
                        background: #F0F0F0;
                        vertical-align: middle;
                        font-weight: bold;
                    }
                    .items td, th {
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                    }
                    .items td.blank {
                        border: none;
                        width: 4pt;
                    }
                    .items td.grey {
                        border: none;
                        background: #F0F0F0;
                        border-right: 1px solid black; 
                    }
                    h2 {
                        text-align: center;
                    }
                    h3 {
                        text-align: center;
                    }
                    .bold {
                        font-weight: bold;
                    }
                    table {
                        border: none;
                        vertical-align: top;
                    }
                    td {
                        vertical-align: top;
                    }
                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                    }
                    td.graph {
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }
                    td.graphBefore {
                        text-align: right;
                        white-space: nowrap;
                        padding-right: 5pt;
                    }
                    hr {
                        border: none;
                        background-color: black;
                        height: 1px;
                    }
                    span.underline {
                        text-decoration: underline;
                    }
				</style>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <!--Обработка корневого элемента-->
   <xsl:template match="ra:ResidentApplication">
      <div class="pagePortrait">
         <h2>Заявление резидента особой экономической зоны</h2>
         <xsl:if test="ra:RegistryNumber">
            <p>
               <span class="bold">Регистрационный номер: </span>
               <xsl:apply-templates select="ra:RegistryNumber"/>
            </p>
         </xsl:if>
         <table style="width: 100%;">
            <tr>
               <td rowspan="4" width="20%"/>
               <td class="graphBefore" rowspan="2">В</td>
               <td class="graphUnderline">
                  <xsl:value-of select="ra:Customs/cat_ru:Code"/>
                  <xsl:if test="ra:Customs/cat_ru:OfficeName">
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="ra:Customs/cat_ru:OfficeName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Код и наименование таможенного органа</td>
            </tr>
            <tr>
               <td class="graphBefore" style="padding-top: 10pt;">От резидента ОЭЗ</td>
               <td style="padding-top: 10pt;">
                  <xsl:call-template name="Organisation">
                     <xsl:with-param name="base" select="ra:Resident/ra:Organisation"/>
                  </xsl:call-template>
                  <xsl:apply-templates select="ra:Resident/ra:IdentityCard"/>
                  <table style="width: 100%">
                     <tr>
                        <td class="graphUnderline">
                           <xsl:apply-templates select="ra:Resident/ra:Address"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Адрес</td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <p style="text-indent: 30pt">
            <xsl:text>Мною предоставляются </xsl:text>
            <span class="underline">
               <xsl:choose>
                  <xsl:when test="ra:ApplicationType = '1'">изменения и (или) дополнения к сведениям</xsl:when>
                  <xsl:otherwise>сведения</xsl:otherwise>
               </xsl:choose>
            </span>
            <xsl:text> о товарах, предполагаемых к ввозу на территорию ОЭЗ в соответствии с таможенным режимом свободной таможенной зоны в </xsl:text>
            <span class="underline">
               <xsl:value-of select="ra:CustomsTreatmentYear"/>
            </span>
            <xsl:text> году, и о совершаемых с ними операциях, а также о товарах, изготавливаемых в результате таких операций, в соответствии с соглашением от </xsl:text>
            <span class="underline">
               <xsl:call-template name="Date">
                  <xsl:with-param name="text" select="ra:ActivitiesAgreement/ra:AgreementDate"/>
               </xsl:call-template>
            </span>
            <xsl:text>, заключённым в: </xsl:text>
            <span class="underline">
               <xsl:value-of select="ra:ActivitiesAgreement/ra:AgreementPlace"/>
            </span>
            <xsl:text>, о ведении </xsl:text>
            <span class="underline">
               <xsl:choose>
                  <xsl:when test="ra:ActivitiesAgreement/ra:ActivitiesType=('true' or '1' or 't')">технико-внедренческой</xsl:when>
                  <xsl:otherwise>производственной</xsl:otherwise>
               </xsl:choose>
            </span>
            <xsl:text> деятельности, на </xsl:text>
            <span class="underline">
               <xsl:choose>
                  <xsl:when test="ra:ActivitiesAgreement/ra:NumberOfPages">
                     <xsl:value-of select="ra:ActivitiesAgreement/ra:NumberOfPages"/>
                  </xsl:when>
                  <xsl:otherwise>(количество не указано)</xsl:otherwise>
               </xsl:choose>
            </span>
            <xsl:text> листах.</xsl:text>
         </p>
         <table>
            <tr>
               <td class="graphBefore" rowspan="2" style="vertical-align: middle;">МП</td>
               <td class="graphUnderline">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="ra:ResidentPersonSignature"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">Ф.И.О., подпись уполномоченного лица резидента, дата</td>
            </tr>
         </table>
         <xsl:if test="ra:CustomsPersonSignature">
            <br/>
            <table>
               <tr>
                  <td class="graphUnderline">
                     <xsl:call-template name="customsSignature">
                        <xsl:with-param name="base" select="ra:CustomsPersonSignature"/>
                     </xsl:call-template>
                  </td>
               </tr>
               <tr>
                  <td class="graph">ФИО и личная номерная печать таможенного инспектора</td>
               </tr>
            </table>
         </xsl:if>
         <xsl:if test="ra:Notes">
            <br/>
            <table>
               <tr>
                  <td class="graphUnderline">
                     <xsl:value-of select="ra:Notes"/>
                  </td>
               </tr>
               <tr>
                  <td class="graph">Для служебных отметок</td>
               </tr>
            </table>
         </xsl:if>
      </div>
      <xsl:apply-templates select="ra:FormOne"/>
      <xsl:apply-templates select="ra:FormTwo"/>
   </xsl:template>
   <xsl:template match="ra:RegistryNumber">
      <xsl:number format="00000001" value="cat_ru:CustomsCode"/>/<xsl:call-template name="DateForCustomsNumber">
         <xsl:with-param name="text" select="cat_ru:RegistrationDate"/>
      </xsl:call-template>/<xsl:value-of select="cat_ru:GTDNumber"/>/<xsl:number format="01" value="ra:RevisionNumber"/>
   </xsl:template>
   <xsl:template name="DateForCustomsNumber">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text,5,1)='-' and substring($text,8,1)='-'">
            <xsl:value-of select="substring($text,9,2)"/>
            <xsl:value-of select="substring($text,6,2)"/>
            <xsl:value-of select="substring($text,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Адрес в виде строки-->
   <xsl:template match="ra:Address">
      <xsl:for-each select="*">
         <xsl:if test="position() > 1">
            <xsl:text>, </xsl:text>
         </xsl:if>
         <xsl:value-of select="."/>
      </xsl:for-each>
   </xsl:template>
   <!--Данные об организации-->
   <xsl:template name="Organisation">
      <xsl:param name="base"/>
      <table style="width: 100%">
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="$base/cat_ru:OrganizationName"/>
               <xsl:if test="$base/cat_ru:ShortName">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="$base/cat_ru:ShortName"/>
                  <xsl:text>)</xsl:text>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование организации / ФИО физического лица</td>
         </tr>
         <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN or $base/cat_ru:RFOrganizationFeatures/cat_ru:INN or $base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Реквизиты</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <!--Документ, удостоверяющий личность-->
   <xsl:template match="ra:IdentityCard">
      <table style="width: 100%">
         <xsl:choose>
            <xsl:when test="(RUScat_ru:IdentityCardName) or (RUScat_ru:IdentityCardCode)">
               <tr>
                  <td class="graphUnderline">
                     <xsl:if test="RUScat_ru:IdentityCardName">
                        <xsl:value-of select="RUScat_ru:IdentityCardName"/>
                     </xsl:if>
                     <xsl:if test="RUScat_ru:IdentityCardCode">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="RUScat_ru:IdentityCardCode"/>
                        <xsl:text>)</xsl:text>
                     </xsl:if>
                  </td>
               </tr>
            </xsl:when>
            <xsl:otherwise>
               <tr>
                  <td class="graphUnderline">
                     <text> </text>
                  </td>
               </tr>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td class="graph">Документ, удостоверяющий личность: Наименование (код)</td>
         </tr>
         <tr>
            <td class="graphUnderline">
               <xsl:if test="RUScat_ru:IdentityCardSeries">
                  <xsl:text>Серия: </xsl:text>
                  <xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
                  <xsl:text> </xsl:text>
               </xsl:if>
               <xsl:if test="RUScat_ru:IdentityCardNumber">
                  <xsl:text>Номер:</xsl:text>
                  <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
               </xsl:if>
               <!--xsl:if test="cat_ru:RBIdentificationNumber">
                  <xsl:text>Номер:</xsl:text>
                  <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
               </xsl:if-->
            </td>
         </tr>
         <tr>
            <td class="graph">Серия (необязательно) и номер документа</td>
         </tr>
         <xsl:if test="RUScat_ru:OrganizationName">
            <tr>
               <td class="graphUnderline">
                  <xsl:value-of select="RUScat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td class="graph">Организация, выдавшая документ</td>
            </tr>
         </xsl:if>
         <tr>
            <td class="graphUnderline">
               <xsl:call-template name="Date">
                  <xsl:with-param name="text" select="RUScat_ru:IdentityCardDate"/>
               </xsl:call-template>
            </td>
         </tr>
         <tr>
            <td class="graph">Дата выдачи документа</td>
         </tr>
      </table>
   </xsl:template>
   <!--Подпись-->
   <xsl:template name="signature">
      <xsl:param name="base"/>
      <xsl:value-of select="$base/cat_ru:PersonSurname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonName"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonMiddleName"/>
      <xsl:if test="$base/cat_ru:PersonPost">
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$base/cat_ru:PersonPost"/>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$base/cat_ru:IssueDate">
         <xsl:call-template name="Date">
            <xsl:with-param name="text" select="$base/cat_ru:IssueDate"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <!--Подпись таможенного инспектора-->
   <xsl:template name="customsSignature">
      <xsl:param name="base"/>
      <xsl:if test="$base/cat_ru:PersonName">
         <xsl:value-of select="$base/cat_ru:PersonName"/>
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="$base/cat_ru:LNP"/>
   </xsl:template>
   <!-- Форма 1 - товары -->
   <xsl:template match="ra:FormOne">
      <div class="pageAlbum">
         <h2>Форма №1 заявления резидента особой экономической зоны</h2>
         <table class="items">
            <tr>
               <th colspan="2" rowspan="2">№<br/>п/п</th>
               <th rowspan="2">Наименование товара</th>
               <th rowspan="2">Код товара по ТН ВЭД ЕАЭС</th>
               <th rowspan="2">Статус товара</th>
               <th colspan="7">Количество товара в основной или в дополнительной единице измерения</th>
            </tr>
            <tr>
               <th>Количество на день подачи заявления</th>
               <th>Единица измерения: название (код)</th>
               <th>Изменения в квартале 1</th>
               <th>Изменения в квартале 2</th>
               <th>Изменения в квартале 3</th>
               <th>Изменения в квартале 4</th>
               <th>Всего</th>
            </tr>
            <xsl:apply-templates select="ra:Operation">
               <xsl:sort select="ra:OperationNumber"/>
            </xsl:apply-templates>
         </table>
         <br/>
         <table style="width: 100%;">
            <tr>
               <td rowspan="3" style="width: 10%"/>
               <td colspan="3" style="text-align: center; padding-bottom: 10pt;">СОГЛАСОВАНО</td>
            </tr>
            <tr>
               <td class="graphUnderline">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="ra:ResidentPersonSignature"/>
                  </xsl:call-template>
               </td>
               <td style="width: 50pt;"/>
               <td class="graphUnderline">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="ra:EconZonePersonSignature"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">ФИО, подпись уполномоченного лица резидента ОЭЗ, дата</td>
               <td style="width: 30 pt;"/>
               <td class="graph">ФИО, подпись уполномоченного лица органа управления ОЭЗ, дата</td>
            </tr>
         </table>
      </div>
   </xsl:template>
   <!--Операция в форме №1-->
   <xsl:template match="ra:Operation">
      <tr>
         <td colspan="12">
            <xsl:value-of select="ra:OperationNumber"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="ra:OperationName"/>
         </td>
         <xsl:apply-templates select="ra:Product">
            <xsl:sort select="ra:Number"/>
         </xsl:apply-templates>
      </tr>
   </xsl:template>
   <!--Товар в форме №1-->
   <xsl:template match="ra:Product">
      <xsl:call-template name="Product"/>
   </xsl:template>
   <!--Товар формы №1 или товар для переработки формы №2-->
   <xsl:template name="Product">
      <xsl:param name="form2" select="'No'"/>
      <tr>
         <td class="blank"/>
         <xsl:if test="$form2 = 'Yes'">
            <td class="blank"/>
         </xsl:if>
         <td>
            <xsl:value-of select="ra:Number"/>
         </td>
         <td>
            <xsl:apply-templates select="ra:Name"/>
         </td>
         <td>
            <xsl:value-of select="ra:TNVEDCode"/>
         </td>
         <td>
            <xsl:apply-templates select="ra:Status"/>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:Quantity"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:value-of select="ra:MeasureUnitQualifierName"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="ra:MeasureUnitQualifierCode"/>
            <xsl:text>)</xsl:text>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:QuantityChangesQ1"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:QuantityChangesQ2"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:QuantityChangesQ3"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:QuantityChangesQ4"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:call-template name="quantity">
               <xsl:with-param name="base" select="ra:QuantityTotal"/>
            </xsl:call-template>
         </td>
      </tr>
   </xsl:template>
   <!--Статус товара. ИН или РОС-->
   <xsl:template match="ra:Status">
      <xsl:choose>
         <xsl:when test=".=('1')">ИН</xsl:when>
         <xsl:otherwise>РОС</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Отображает 0, если число не указано-->
   <xsl:template name="quantity">
      <xsl:param name="base"/>
      <xsl:choose>
         <xsl:when test="$base">
            <xsl:value-of select="$base"/>
         </xsl:when>
         <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Форма 2 - продукты перерработки, отходы и товары для переработки -->
   <xsl:template match="ra:FormTwo">
      <div class="pageAlbum">
         <h2>Форма №2 заявления резидента особой экономической зоны</h2>
         <table class="items">
            <tr>
               <th colspan="3" rowspan="2">№<br/>п/п</th>
               <th rowspan="2">Наименование товара</th>
               <th rowspan="2">Код товара по ТН ВЭД ЕАЭС</th>
               <th rowspan="2">Статус товара/<br/>Система исчисления ставок таможенных пошлин</th>
               <th colspan="7">Количество товара в основной или в дополнительной единице измерения</th>
            </tr>
            <tr>
               <th>Количество на день подачи заявления</th>
               <th>Единица измерения: название (код)</th>
               <th>Изменения в квартале 1</th>
               <th>Изменения в квартале 2</th>
               <th>Изменения в квартале 3</th>
               <th>Изменения в квартале 4</th>
               <th>Всего</th>
            </tr>
            <tr>
               <xsl:call-template name="countedTD">
                  <xsl:with-param name="count" select="10"/>
               </xsl:call-template>
            </tr>
            <xsl:apply-templates select="ra:Section">
               <xsl:sort select="ra:Name"/>
            </xsl:apply-templates>
         </table>
         <br/>
         <table style="width: 100%;">
            <tr>
               <td rowspan="3" style="width: 10%"/>
               <td colspan="3" style="text-align: center; padding-bottom: 10pt;">СОГЛАСОВАНО</td>
            </tr>
            <tr>
               <td class="graphUnderline">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="ra:ResidentPersonSignature"/>
                  </xsl:call-template>
               </td>
               <td style="width: 50pt;"/>
               <td class="graphUnderline">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="ra:EconZonePersonSignature"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">ФИО, подпись уполномоченного лица резидента ОЭЗ, дата</td>
               <td style="width: 30 pt;"/>
               <td class="graph">ФИО, подпись уполномоченного лица органа управления ОЭЗ, дата</td>
            </tr>
         </table>
      </div>
   </xsl:template>
   <!--Ячейки 1 - ... в заголовке таблицы формы 2-->
   <xsl:template name="countedTD">
      <xsl:param name="count"/>
      <xsl:param name="total" select="$count"/>
      <xsl:choose>
         <xsl:when test="$total = $count">
            <th colspan="3">
               <xsl:value-of select="$total - $count + 1"/>
            </th>
         </xsl:when>
         <xsl:otherwise>
            <th>
               <xsl:value-of select="$total - $count + 1"/>
            </th>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$count > 0">
         <xsl:call-template name="countedTD">
            <xsl:with-param name="count" select="$count - 1"/>
            <xsl:with-param name="total" select="$total"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <!--Раздел в форме №2-->
   <xsl:template match="ra:Section">
      <tr>
         <td colspan="13">
            <xsl:value-of select="ra:Name"/>
         </td>
      </tr>
      <xsl:if test="count(ra:ProductOfRecycling) > 0">
         <tr>
            <td class="blank"/>
            <td colspan="12">Продукты(ы) переработки</td>
         </tr>
         <xsl:apply-templates select="ra:ProductOfRecycling">
            <xsl:sort select="ra:Number"/>
         </xsl:apply-templates>
      </xsl:if>
      <xsl:if test="count(ra:WasteProduct) > 0">
         <tr>
            <td class="blank"/>
            <td colspan="12">Отходы</td>
         </tr>
         <xsl:apply-templates select="ra:WasteProduct">
            <xsl:sort select="ra:Number"/>
         </xsl:apply-templates>
      </xsl:if>
      <xsl:if test="count(ra:ProductForRecycling) > 0">
         <tr>
            <td class="blank"/>
            <td colspan="12">Товары для переработки</td>
         </tr>
         <xsl:apply-templates select="ra:ProductForRecycling">
            <xsl:sort select="ra:Number"/>
         </xsl:apply-templates>
      </xsl:if>
   </xsl:template>
   <!--Товар для переработки-->
   <xsl:template match="ra:ProductForRecycling">
      <xsl:call-template name="Product">
         <xsl:with-param name="form2">Yes</xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   <!--Отходы-->
   <xsl:template match="ra:WasteProduct">
      <xsl:call-template name="Recycling"/>
   </xsl:template>
   <!--Продукты переработки-->
   <xsl:template match="ra:ProductOfRecycling">
      <xsl:call-template name="Recycling"/>
   </xsl:template>
   <!--Продукт переработки и отходы-->
   <xsl:template name="Recycling">
      <tr>
         <td class="blank"/>
         <td class="blank"/>
         <td>
            <xsl:value-of select="ra:Number"/>
         </td>
         <td>
            <xsl:apply-templates select="ra:Name"/>
         </td>
         <td>
            <xsl:value-of select="ra:TNVEDCode"/>
         </td>
         <td>
            <xsl:apply-templates select="ra:Status"/>/<xsl:apply-templates select="ra:CustomsDutyRateSystem"/>
         </td>
         <td class="grey" colspan="7"/>
      </tr>
   </xsl:template>
</xsl:stylesheet>
