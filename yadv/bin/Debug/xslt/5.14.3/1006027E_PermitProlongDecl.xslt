<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ppd="urn:customs.ru:Information:CustomsDocuments:PermitProlongDecl:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Разрешение на продление сроков подачи декларации</title>
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
                    h2 {
                        text-align: center; 
                    }
                    table {
                        border: none; 
                        vertical-align: top; 
                    }
                    td {
                        vertical-align: top; 
                    }
                    td.graphUnderline {
						border : none; 
                        border-bottom: 1px solid black; 
                        text-align: center; 
                    }
                    td.graph {
						border : none; 
                        font-size: 7pt; 
                        text-align: center; 
                        padding: 0; 
                        spacing: 0; 
                        white-space: normal; 
                    }
				</style>
         </head>
         <body>
            <xsl:apply-templates select="ppd:PermitProlongDecl"/>
         </body>
      </html>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали-->
   <xsl:template name="date">
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
   <!-- Шаблон вывода информации о дате направления решения -->
   <xsl:template match="ppd:PermitNumber">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:call-template name="date">
                  <xsl:with-param name="text" select="."/>
               </xsl:call-template>
            </td>
         </tr>
         <tr>
            <td class="graph">№ Разрешения</td>
         </tr>
      </table>
   </xsl:template>
   <!--Шаблон для отображения информации о таможне-->
   <xsl:template name="Custom">
      <xsl:param name="base"/>
      <table style="width: 100%">
         <tr>
            <td class="graphUnderline">
               <xsl:if test="$base/cat_ru:OfficeName">
                  <xsl:value-of select="$base/cat_ru:OfficeName"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование таможенного органа</td>
         </tr>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="$base/cat_ru:Code"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Код таможенного органа</td>
         </tr>
      </table>
   </xsl:template>
   <!--Шаблон вывода информации о должностном лице-->
   <xsl:template name="CustomsPerson">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="ppd:CustomsPerson/cat_ru:PersonName"/>
               <xsl:text> / </xsl:text>
               <xsl:if test="ppd:CustomsPerson/cat_ru:LNP">
                  <xsl:value-of select="ppd:CustomsPerson/cat_ru:LNP"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td>
					ФИО должностного лица таможенного органа / ЛНП
				</td>
         </tr>
      </table>
   </xsl:template>
   <!-- Шаблон корневого элемента -->
   <xsl:template match="ppd:PermitProlongDecl">
      <div class="pagePortrait">
         <h2>Разрешение на продление сроков подачи декларации</h2>
         <div style="float : left;">
            <xsl:apply-templates select="ppd:PermitNumber"/>
         </div>
         <div style="float: right;  max-width: 120mm; ">
            <xsl:call-template name="Custom">
               <xsl:with-param name="base" select="ppd:Customs"/>
            </xsl:call-template>
         </div>
         <div style="clear:both;  padding-top: 10pt; "/>
         <div style="text-indent : 30pt;">
            <xsl:text>В соответствии с таможенным законодательством ЕАЭС уведомляем, что </xsl:text>
            <xsl:call-template name="date">
               <xsl:with-param name="text" select="ppd:SendDate"/>
            </xsl:call-template>
            <xsl:text> принято решение о продлении сроков подачи таможенной декларации до </xsl:text>
            <xsl:call-template name="date">
               <xsl:with-param name="text" select="ppd:ProlongDeclDate"/>
            </xsl:call-template>
         </div>
         <xsl:choose>
            <xsl:when test="count(ppd:Comments) = 1">
               <xsl:text>Комментарий </xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>Комментарии </xsl:text>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:text>к принятому решению:</xsl:text>
         <ul>
            <xsl:for-each select="ppd:Comments">
               <li>
                  <xsl:value-of select="."/>
               </li>
            </xsl:for-each>
         </ul>
         <div style="float: right; ">
            <xsl:call-template name="CustomsPerson"/>
         </div>
         <div style="clear: both;"/>
      </div>
   </xsl:template>
</xsl:stylesheet>
