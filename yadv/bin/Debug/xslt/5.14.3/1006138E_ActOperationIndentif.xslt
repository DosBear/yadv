<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:aopin="urn:customs.ru:Information:CustomsDocuments:ActOperationIndentif:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="gtd"/>
      <xsl:choose>
         <xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
            <xsl:value-of select="substring($gtd,9,2)"/>
            <xsl:value-of select="substring($gtd,6,2)"/>
            <xsl:value-of select="substring($gtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$gtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
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
   <xsl:template match="aopin:ActOperationIndentif">
      <html>
         <head>
            <title>Акт об изменении, удалении, уничтожении или замене средств идентификации</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
					background: #cccccc;
					}
				div.page {
					width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;
					}						
				td {
					font-family:Arial;
					}
				.normal{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
					}
				.bold{
					font-weight: bold;
					font-family:Arial;
					font-size: 13pt;
					}
				.italic{
					font-style: italic; 
					font-family:Arial;
					font-size: 9pt
					}
				.graph {
					font-family: Arial;
					font-size: 10pt;
					font-weight: bold;
					}
				.graphMain {
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
				.graphMain {
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
				.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}
				.graph14Bold {
					font-family: Arial;
					font-size: 14pt;
					font-weight: bold;
					}				
				.bordered {
					border-bottom: solid 1pt #000000;
					}	
				.uplined {
					border-top: solid 1pt #000000;
					}					
            </style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tbody>
                     <tr>
                        <td align="center" class="bordered">
                           <xsl:value-of select="aopin:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
										(наименование таможенного органа)
									</td>
                     </tr>
                     <tr>
                        <td>
                           <br/>
                           <br/>
                           <span class="graph14Bold">АКТ</span><br/><br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>об изменении, удалении, уничтожении или замене средств идентификации </b><br/><br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:210mm">
							 <tr>
								<td align="left" style="width:60mm">
									&lt;&lt;<span class="bordered"><xsl:value-of select="substring(aopin:ActDate,9,2)"/></span> &gt;&gt;
									<span class="bordered">
									  <xsl:choose>
										 <xsl:when test="substring(aopin:ActDate,6,2)='01'">января</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='02'">февраля</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='03'">марта</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='04'">апреля</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='05'">мая</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='06'">июня</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='07'">июля</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='08'">августа</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='09'">сентября</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='10'">октября</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='11'">ноября</xsl:when>
										 <xsl:when test="substring(aopin:ActDate,6,2)='12'">декабря</xsl:when>
									  </xsl:choose> 
									</span>
								   <xsl:value-of select="substring(aopin:ActDate,1,4)"/>
								</td>
								<td style="width:90mm">
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>
								<td style="width:60mm">
									№ <span class="bordered"><xsl:value-of select="aopin:ActNumber"/></span>
								</td>
							 </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:210mm">
							 <tr>
								<td align="left" style="width:20mm">В связи с</td>
								<td class="bordered" style="width:190mm"><xsl:value-of select="aopin:DescriptionCircumstances"/></td>
							 </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">(краткое описание обстоятельств)</td>
                     </tr>
                     <tr>
                        <td align="left">
							и на основании статьи 341 Таможенного кодекса Евразийского экономического союза со средствами идентификации проведено: 
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <xsl:if test="aopin:OperationIndentif='1'">
                                       <td>[Х] - удаление </td>
                                       <td>[&#160;] - изменение</td>
                                       <td>[&#160;] - замена</td>
                                       <td>[&#160;] - уничтожение</td>
                                    </xsl:if>
                                    <xsl:if test="aopin:OperationIndentif='2'">
                                       <td>[&#160;] - удаление</td>
                                       <td>[Х] - изменение</td>
                                       <td>[&#160;] - замена</td>
                                       <td>[&#160;] - уничтожение</td>
                                    </xsl:if>
                                    <xsl:if test="aopin:OperationIndentif='3'">
                                       <td>[&#160;] - удаление</td>
                                       <td>[&#160;] - изменение</td>
                                       <td>[Х] - замена</td>
                                       <td>[&#160;] - уничтожение</td>
                                    </xsl:if>
                                    <xsl:if test="aopin:OperationIndentif='4'">
                                       <td>[&#160;] - удаление</td>
                                       <td>[&#160;] - изменение</td>
                                       <td>[&#160;] - замена</td>
                                       <td>[Х] - уничтожение</td>
                                    </xsl:if>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Место проведения операций по изменению, удалению, уничтожению или замене средств идентификации:</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:value-of select="aopin:OperationPlace/aopin:InspPlaceName"/> 
							<xsl:if test="aopin:OperationPlace/cat_ru:OfficeName"><xsl:value-of select="aopin:OperationPlace/cat_ru:OfficeName"/> </xsl:if>
                           <xsl:if test="aopin:OperationPlace/aopin:InformationTypeCode"><xsl:value-of select="aopin:OperationPlace/aopin:InformationTypeCode"/> </xsl:if>
                           <xsl:if test="aopin:OperationPlace/aopin:InspPlaceDesc">&#160;
                              <xsl:for-each select="aopin:OperationPlace/aopin:InspPlaceDesc"><xsl:value-of select="."/> </xsl:for-each>
                           </xsl:if>
                           <xsl:if test="aopin:OperationPlace/aopin:WarehousePlace">&#160;
                              <xsl:value-of select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentName"/> 
								№ <xsl:value-of select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
								&#160;от 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="aopin:OperationPlace/aopin:WarehousePlace/cat_ru:PrDocumentDate"/>
								</xsl:call-template> 
						   </xsl:if>
                           <xsl:if test="aopin:OperationPlace/aopin:Address">&#160;
                              <xsl:for-each select="aopin:OperationPlace/aopin:Address"><xsl:call-template name="Address"/> </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Номера транспортных средств и контейнеров, на которых удалены или изменены средства идентификации</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:for-each select="aopin:TransportIdentifier">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Описание измененных, удаленых, уничтоженных или заменены средств идентификации:
								</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:for-each select="aopin:DescriptionIdentif">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle">
							(номера пломб, печатей, их количество, буквенная или иная маркировка, идентификационные знаки и т.п.)
						</td>
                     </tr>
                     <tr>
                        <td align="left">Описание новых средств идентификации:</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:for-each select="aopin:DescriptionNewIdentif">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle">
							(номера пломб, печатей, их количество, буквенная или иная маркировка, идентификационные знаки и т.п.)
						</td>
                     </tr>
                     <tr>
                        <td align="left"> Должностное лицо таможенного органа:</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:value-of select="aopin:CustomsPerson/aopin:PersonPost"/> 
							<xsl:value-of select="aopin:CustomsPerson/cat_ru:PersonName"/> 
							<xsl:value-of select="aopin:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle">
							(подпись, должность, фамилия, инициалы, личная номерная печать)
						</td>
                     </tr>
                     <tr>
                        <td align="left"> Лицо, обладающее полномочиями в отношении товаров(представитель лица):</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:value-of select="aopin:PersonGoods/cat_ru:PersonSurname"/> 
							<xsl:value-of select="aopin:PersonGoods/cat_ru:PersonName"/> 
							<xsl:value-of select="aopin:PersonGoods/cat_ru:PersonMiddleName"/> 
							<xsl:value-of select="aopin:PersonGoods/cat_ru:PersonPost"/> 
							<xsl:value-of select="aopin:PersonGoods/aopin:Job"/> 
						</td>
                     </tr>
                     <tr>
                        <td class="graphLittle">
							(подпись, место работы, должность, фамилия, инициалы)
						</td>
                     </tr>
                     <tr>
                        <td align="left" style="width:60mm">
							&lt;&lt;<span class="bordered">
						  <xsl:value-of select="substring(aopin:PersonGoods/cat_ru:IssueDate,9,2)"/>
                           </span>&gt;&gt;
						   <span class="bordered">
                              <xsl:choose>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='01'">января</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='02'">февраля</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='03'">марта</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='04'">апреля</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='05'">мая</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='06'">июня</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='07'">июля</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='08'">августа</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='09'">сентября</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='10'">октября</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='11'">ноября</xsl:when>
                                 <xsl:when test="substring(aopin:PersonGoods/cat_ru:IssueDate,6,2)='12'">декабря</xsl:when>
                              </xsl:choose> 
						   </span>
                           <xsl:value-of select="substring(aopin:PersonGoods/cat_ru:IssueDate,1,4)"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphLittle">Дата применения средств(а) идентификации</td>
                     </tr>
                     <tr>
                        <td align="left"> Второй экземпляр акта на руки получил:</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:value-of select="aopin:SecondCopyReceived/cat_ru:PersonSurname"/> 
							<xsl:value-of select="aopin:SecondCopyReceived/cat_ru:PersonName"/> 
							<xsl:value-of select="aopin:SecondCopyReceived/cat_ru:PersonMiddleName"/> 
							<xsl:value-of select="aopin:SecondCopyReceived/cat_ru:PersonPost"/> 
							<xsl:value-of select="aopin:SecondCopyReceived/aopin:Job"/> 
						</td>
                     </tr>
                     <tr>
                        <td class="graphLittle">
							(подпись, место работы, должность, фамилия, инициалы лица, которому вручен второй экземпляр акта)
						</td>
                     </tr>
                     <tr>
                        <td align="left" style="width:60mm">
							&lt;&lt;<span class="bordered">
                            <xsl:value-of select="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,9,2)"/>
                           </span>&gt;&gt;
							<span class="bordered">
                              <xsl:choose>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='01'">января</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='02'">февраля</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='03'">марта</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='04'">апреля</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='05'">мая</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='06'">июня</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='07'">июля</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='08'">августа</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='09'">сентября</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='10'">октября</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='11'">ноября</xsl:when>
                                 <xsl:when test="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,6,2)='12'">декабря</xsl:when>
                              </xsl:choose> 
							</span>
                           <xsl:value-of select="substring(aopin:SecondCopyReceived/cat_ru:IssueDate,1,4)"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphLittle">Дата получения второго экземпляра</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
