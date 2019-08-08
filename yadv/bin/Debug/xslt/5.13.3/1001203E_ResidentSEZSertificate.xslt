<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rsezc="urn:customs.ru:Information:RegistrationDocuments:ResidentSEZSertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Свидетельство, удостоверяющее регистрацию лица в качестве резидента особой экономической зоны</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
                        text-align: center;
                    }

                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                    }

                    td.graph {
                        font-size: 8pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                        padding-right: 5pt;
                        padding-left: 5pt;
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

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <!--Обработка корневого элемента-->
   <xsl:template match="rsezc:ResidentSEZSertificate">
      <div class="pagePortrait">
         <h3>СВИДЕТЕЛЬСТВО, УДОСТОВЕРЯЮЩЕЕ РЕГИСТРАЦИЮ ЛИЦА В КАЧЕСТВЕ РЕЗИДЕНТА ОСОБОЙ ЭКОНОМИЧЕСКОЙ ЗОНЫ</h3>
         <table style="width: 100%;">
            <tr>
               <td colspan="2" style="text-align: left; text-indent: 20pt;">
                        Настоящим подтверждается, что в соответствии с Федеральным
                        законом "Об особых экономических зонах в Российской Федерации" в
                        реестр резидентов особой экономической зоны внесена запись о регистрации
                    </td>
            </tr>
            <tr>
               <td class="graphUnderline" colspan="2">
                  <!--xsl:value-of select="rsezc:ResidentOrganisation/rsezc:OrganizationName"/-->
                  <xsl:if test="rsezc:ResidentOrganisation/rsezc:Type = 0">индивидуальный предприниматель</xsl:if>
                  <xsl:if test="rsezc:ResidentOrganisation/rsezc:Type = 1">юридическое лицо</xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2">(юридическое лицо или индивидуальный предприниматель)</td>
            </tr>
            <tr>
               <td align="left" nowrap="nowrap" width="10%">в качестве резидента особой экономической зоны</td>
               <td class="graphUnderline">
                  <xsl:apply-templates select="rsezc:SEZType"/>
               </td>
            </tr>
            <tr>
               <td/>
               <td class="graph">(тип особой экономической зоны)</td>
            </tr>
            <tr>
               <td class="graphUnderline" colspan="2" style="padding-top: 15pt;">
                  <xsl:value-of select="rsezc:ResidentOrganisation/rsezc:FullName"/>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2">полное наименование юридического лица с указанием
                        организационно-правовой формы или Ф.И.О. индивидуального предпринимателя)
                    </td>
            </tr>
            <tr>
               <td class="graphUnderline" colspan="2" style="padding-top: 15pt;">
                  <xsl:value-of select="rsezc:ResidentOrganisation/rsezc:ShortName"/>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2">(сокращенное наименование юридического лица)</td>
            </tr>
            <tr>
               <td class="graphUnderline" colspan="2" style="padding-top: 15pt;">
                  <xsl:value-of select="rsezc:ResidentOrganisation/rsezc:FirmName"/>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2">(фирменное наименование)</td>
            </tr>
            <tr>
               <td colspan="2" style="padding-top: 15pt;">
                  <xsl:call-template name="IssueOrRegistrationDate">
                     <xsl:with-param name="base" select="rsezc:RegistrationDate"/>
                     <xsl:with-param name="text" select="'Дата регистрации'"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td colspan="2" style="padding-top: 15pt;">
                  <xsl:apply-templates select="rsezc:SertificateNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graphUnderline" colspan="2" style="padding-top: 15pt;">
                  <xsl:value-of select="rsezc:RegistratorAuthority/rsezc:Organisation/cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2">(Наименование органа, осуществившего регистрацию)</td>
            </tr>
            <tr>
               <td colspan="2" style="padding-top: 15pt;">
                  <xsl:call-template name="IssueOrRegistrationDate">
                     <xsl:with-param name="base" select="rsezc:IssueDate"/>
                     <xsl:with-param name="text" select="'Дата выдачи свидетельства'"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td colspan="2" style="padding-top: 15pt;">
                  <xsl:apply-templates select="rsezc:RegistratorAuthority/rsezc:AuthorisdPersonSignature"/>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:text> </xsl:text>
               </td>
               <td>
                  <xsl:value-of select="rsezc:Form/rsezc:FormSerial"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="rsezc:Form/rsezc:FormNumber"/>
               </td>
            </tr>
         </table>
      </div>
   </xsl:template>
   <!-- Дата регистрации или выдачи свидетельства -->
   <xsl:template name="IssueOrRegistrationDate">
      <xsl:param name="base"/>
      <xsl:param name="text"/>
      <table align="center">
         <tr>
            <td>
               <xsl:value-of select="$text"/>
            </td>
            <td class="graphUnderline">
               <xsl:value-of select="substring($base,9,2)"/>
            </td>
            <td class="graphUnderline">
               <xsl:call-template name="MonthName">
                  <xsl:with-param name="month" select="substring($base,6,2)"/>
               </xsl:call-template>
            </td>
            <td class="graphUnderline">
               <xsl:value-of select="substring($base,1,4)"/>
            </td>
         </tr>
         <tr>
            <td/>
            <td class="graph">(число)</td>
            <td class="graph">(месяц (прописью))</td>
            <td class="graph">(год)</td>
         </tr>
      </table>
   </xsl:template>
   <!-- Номер свидетельства -->
   <xsl:template match="rsezc:SertificateNumber">
        за регистрационным номером
        <br/>
      <br/>
      <table align="center">
         <tr>
            <td class="graphUnderline"/>
         </tr>
         <tr>
            <td>
               <xsl:value-of select="."/>
            </td>
         </tr>
         <tr>
            <td class="graphUnderline"/>
         </tr>
      </table>
   </xsl:template>
   <!-- Уполномоченное лицо органа, осуществившего регистрацию -->
   <xsl:template match="rsezc:AuthorisdPersonSignature">
      <table width="100%">
         <tr>
            <td nowrap="nowrap" width="10%">Уполномоченное лицо органа, осуществившего регистрацию</td>
            <td class="graphUnderline">
               <xsl:call-template name="signature">
                  <xsl:with-param name="base" select="."/>
               </xsl:call-template>
            </td>
         </tr>
         <tr>
            <td/>
            <td class="graph">(подпись, ФИО)</td>
         </tr>
         <tr>
            <td/>
            <td class="graph" style="padding-top: 15pt;">М.П.</td>
         </tr>
      </table>
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
   <!--Тип ОЭЗ: 1 - промышленно-производственная, 0 - технико-внедренческая-->
   <xsl:template match="rsezc:SEZType">
      <xsl:choose>
         <xsl:when test=". = 0">технико-внедренческая</xsl:when>
         <xsl:otherwise>промышленно-производственная</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Месяц прописью-->
   <xsl:template name="MonthName">
      <xsl:param name="month"/>
      <xsl:choose>
         <xsl:when test="$month = '01'">января</xsl:when>
         <xsl:when test="$month = '02'">февраля</xsl:when>
         <xsl:when test="$month = '03'">марта</xsl:when>
         <xsl:when test="$month = '04'">апреля</xsl:when>
         <xsl:when test="$month = '05'">мая</xsl:when>
         <xsl:when test="$month = '06'">июня</xsl:when>
         <xsl:when test="$month = '07'">июля</xsl:when>
         <xsl:when test="$month = '08'">августа</xsl:when>
         <xsl:when test="$month = '09'">сентября</xsl:when>
         <xsl:when test="$month = '10'">октября</xsl:when>
         <xsl:when test="$month = '11'">ноября</xsl:when>
         <xsl:when test="$month = '12'">декабря</xsl:when>
         <xsl:otherwise>-ОШИБКА-</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
