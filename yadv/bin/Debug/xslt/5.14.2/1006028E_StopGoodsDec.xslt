<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:std="urn:customs.ru:Information:ExchangeDocuments:StopGoodsDec:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Решение о приостановлении выпуска товаров</title>
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
                        border: solid .8pt #000000; 
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
                        /*white-space: normal; */
                    }
				</style>
         </head>
         <body>
            <xsl:apply-templates select="std:StopGoodsDec"/>
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
   <xsl:template match="std:SendDate">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:call-template name="date">
                  <xsl:with-param name="text" select="."/>
               </xsl:call-template>
            </td>
         </tr>
         <tr>
            <td class="graph">Дата направления</td>
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
         <tr>
            <td class="graphUnderline">
               <xsl:for-each select="$base/std:CustomsAddress">
                  <xsl:call-template name="Address"/>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="graph">Адрес таможенного органа</td>
         </tr>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="$base/std:Phone"/> 
						<xsl:value-of select="$base/std:Fax"/> 
						<xsl:value-of select="$base/std:Telex"/> 
						<xsl:value-of select="$base/std:Email"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Телефон, факс, телекс, электронная почта</td>
         </tr>
      </table>
   </xsl:template>
   <!--Шаблон вывода информации о должностном лице-->
   <xsl:template name="CustomsPerson">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="std:CustomsPerson/cat_ru:PersonName"/>
               <xsl:text> / </xsl:text>
               <xsl:if test="std:CustomsPerson/cat_ru:LNP">
                  <xsl:value-of select="std:CustomsPerson/cat_ru:LNP"/>
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
   <!-- Шаблон адреса -->
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <!-- Шаблон корневого элемента -->
   <xsl:template match="std:StopGoodsDec">
      <div class="pagePortrait">
         <h2>Решение о приостановлении выпуска товаров</h2>
         <div style="float : left;">
            <xsl:apply-templates select="std:SendDate"/>
         </div>
         <div style="float: right;  max-width: 120mm; ">
            <xsl:call-template name="Custom">
               <xsl:with-param name="base" select="std:Customs"/>
            </xsl:call-template>
         </div>
         <div style="clear:both;  padding-top: 10pt; "/>
         <div style="text-indent : 30pt;">
            <table>
               <tbody>
                  <tr>
                     <td>
							В соответствии со статьей 124 Таможенного кодекса Таможенного союза ЕАЭС уведомляем, что 
				<xsl:call-template name="date">
                           <xsl:with-param name="text" select="std:DecIssueDate"/>
                        </xsl:call-template>
				по декларации №<u>
                           <xsl:value-of select="std:DeclarationNumber/cat_ru:CustomsCode"/>/
				<xsl:value-of select="substring(std:DeclarationNumber/cat_ru:RegistrationDate,9,2)"/>
                           <xsl:value-of select="substring(std:DeclarationNumber/cat_ru:RegistrationDate,6,2)"/>
                           <xsl:value-of select="substring(std:DeclarationNumber/cat_ru:RegistrationDate,3,2)"/>/
				<xsl:value-of select="std:DeclarationNumber/cat_ru:GTDNumber"/>
                        </u> принято решение о приостановлении выпуска по следующим товарам: 
								
				
				
							</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <table align="center" border="1" cellpadding="0" cellspacing="0" style="width:180mm">
                           <tbody>
                              <tr>
                                 <td align="center" style="width:20mm">Номер товара по ДТ</td>
                                 <td align="center" style="width:35mm">Описание товара</td>
                                 <td align="center" style="width:50mm">Документы на товар</td>
                                 <td align="center" style="width:25mm">Объект интеллектуальной собственности</td>
                                 <td align="center" style="width:50mm">Признаки контрафактности</td>
                              </tr>
                              <xsl:for-each select="std:RestrictionGoodsInfo">
                                 <tr>
                                    <td>
                                       <xsl:value-of select="std:GoodsNumeric"/>
                                    </td>
                                    <td>
                                       <xsl:for-each select="std:GoodsDescriptions">
                                          <xsl:value-of select="."/> 
												</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:for-each select="std:GoodsDoc">
                                          <xsl:value-of select="cat_ru:PrDocumentName"/> 
													от
													<xsl:value-of select="substring(cat_ru:PrDocumentDate,9,2)"/>.<xsl:value-of select="substring(cat_ru:PrDocumentDate,6,2)"/>.<xsl:value-of select="substring(cat_ru:PrDocumentDate,1,4)"/> 
													№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                          <br/>
                                       </xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:value-of select="std:IntellectualPropertyObject"/>
                                    </td>
                                    <td>
                                       <xsl:for-each select="std:CounterfeitSigns">
                                          <xsl:value-of select="."/> 
												</xsl:for-each>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td>
							На срок до <u>
                           <xsl:call-template name="date">
                              <xsl:with-param name="text" select="std:DecEndDate"/>
                           </xsl:call-template>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td>
							Местонахождение товаров: <u>
                           <xsl:value-of select="std:GoodsLocation"/>
                        </u>
                     </td>
                  </tr>
                  <tr>
                     <td>
							Декларант/ правообладатель(представитель): 
							<u>
                           <xsl:for-each select="std:RightPerson">
                              <xsl:value-of select="std:Name"/> 
								(<xsl:for-each select="std:PostalAddress">
                                 <xsl:call-template name="Address"/>
                              </xsl:for-each>)<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <!--Данный div нужен для того, чтобы родительский div автоматически увеличивал свои размеры (высоту) с учётом
            содержимого div с float, который есть выше -->
         <div style="clear: both;"/>
      </div>
   </xsl:template>
</xsl:stylesheet>
