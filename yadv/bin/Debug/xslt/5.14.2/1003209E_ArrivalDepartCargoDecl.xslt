<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:adcd="urn:customs.ru:Information:TransportDocuments:Sea:ArrivalDepartCargoDecl:5.12.0" xmlns:catTrans_cu="urn:customs.ru:Information:TransportDocuments:CUTransportCommonAgregateTypesCust:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="adcd:ArrivalDepartCargoDecl">
      <html>
         <head>
            <title>Декларация о грузе при приходе/отходе судна</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							height: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	20mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 8pt;
							}
						td {
							font-family:Courier;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
					</style>
         </head>
         <body>
            <div class="page">
               <p align="right">ИМО ФАЛ</p>
               <p align="right">Форма 2</p>
               <h2>ИМО ДЕКЛАРАЦИЯ О ГРУЗЕ</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" colspan="2" style="width:77.5mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:5mm;">
                           <xsl:choose>
                              <xsl:when test="adcd:DocSign='0'">X</xsl:when>
                              <xsl:otherwise> </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td align="left" class="graph" style="width:25mm;">Приход</td>
                        <td class="graph" style="width:5mm;">
                           <xsl:choose>
                              <xsl:when test="adcd:DocSign='1'">X</xsl:when>
                              <xsl:otherwise> </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td align="left" class="graph" style="width:25mm;">Отход</td>
                        <td align="left" class="graph" style="width:27.5mm;">Стр.№</td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" colspan="2" style="width:77.5mm;">
                           <span class="graph">1.Название судна</span>
                           <br/>
                           <xsl:value-of select="adcd:Vessel/catTrans_ru:Name"/>
                        </td>
                        <td align="left" class="graph" colspan="5" style="width:87.5mm;">
                           <span class="graph">2.Порт, где дано извещение</span>
                           <br/>
                           <xsl:if test="adcd:DeclarationPort">
                              <xsl:value-of select="adcd:DeclarationPort"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" style="width:35mm;">
                           <span class="graph">3.Национальная принадлежность судна</span>
                           <br/>
                           <xsl:if test="adcd:Vessel/catTrans_ru:NationalityCode">
                              <xsl:value-of select="adcd:Vessel/catTrans_ru:NationalityCode"/>
                           </xsl:if>
                        </td>
                        <td align="left" class="graph" style="width:42.5mm;">
                           <span class="graph">4.Фамилия капитана</span>
                           <br/>
                           <xsl:if test="adcd:Vessel/catTrans_ru:Shipmaster">
                              <xsl:value-of select="adcd:Vessel/catTrans_ru:Shipmaster"/>
                           </xsl:if>
                        </td>
                        <td align="left" class="graph" colspan="5" style="width:87.5mm;">
                           <span class="graph">5.Порт погрузки/порт выгрузки</span>
                           <br/>
                           <xsl:value-of select="adcd:DepartDestinPort"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">К/С*</td>
                        <td align="left" class="graph" style="width:35mm;">6. Марки и номера</td>
                        <td align="left" class="graph" colspan="4" style="width:77.5mm;">7. Количество и вид упаковки; описание грузов</td>
                        <td align="left" class="graph" style="width:25mm;">8. Вес брутто</td>
                        <td align="left" class="graph" style="width:27.5mm;">9.Размеры</td>
                     </tr>
                     <xsl:for-each select="adcd:Goods">
                        <tr>
                           <td align="left" class="graph" style="width:15mm;">
                              <xsl:if test="adcd:BillofLading/cat_ru:PrDocumentNumber">
                                 <xsl:value-of select="adcd:BillofLading/cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                           </td>
                           <td align="left" class="graph" style="width:35mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="cat_ru:GoodsMarking">
                                 <xsl:value-of select="cat_ru:GoodsMarking"/>
                              </xsl:if>
                           </td>
                           <td align="left" class="graph" colspan="4" style="width:77.5mm;">
                              <xsl:for-each select="adcd:PlacesInfo">
                                 <xsl:value-of select="catTrans_cu:PakingQuantity"/> 
									    <xsl:if test="catTrans_cu:PackingDescription">
                                    <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                 </xsl:if>
                                 <br/>
                              </xsl:for-each>
                              <xsl:for-each select="cat_ru:GoodsDescription">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()"> </xsl:if>
                              </xsl:for-each>
                           </td>
                           <td align="left" class="graph" style="width:25mm;">
                              <xsl:value-of select="adcd:GrossWeightQuantity"/>
                           </td>
                           <td align="left" class="graph" style="width:27.5mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="adcd:Dimensions">
                                 <xsl:value-of select="adcd:Dimensions"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <p align="left" class="graph">10.Дата и подпись капитана, уполномоченного агента или лица командного состава</p>
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <xsl:if test="adcd:DocumentSignature/cat_ru:PersonPost">
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonPost"/>
                           </xsl:if>
                           <br/>
                           <xsl:if test="adcd:DocumentSignature/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adcd:DocumentSignature/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <!--xsl:text>_____________</xsl:text-->
                           <u>
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:if test="adcd:DocumentSignature/cat_ru:PersonMiddleName">
                                 <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                           </u>
                           <br/>
                           <span class="graph">(Подпись,фамилия,инициалы)</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="graph">* Номер транспортного документа</p>
               <p align="left" class="graph">Также сообщите начальный и конечный порты транспортировки в отношении грузов, перевозимых по мультимодальному транспортному документу или сквозному коносаменту.</p>
            </div>
            <div class="page">
               <p align="right">IMO FAL</p>
               <p align="right">Form 2</p>
               <h2>IMO CARGO DECLARATION</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="2" style="width:77.5mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:5mm;">
                           <xsl:choose>
                              <xsl:when test="adcd:DocSign='0'">X</xsl:when>
                              <xsl:otherwise> </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td align="left" class="graph" style="width:25mm;">Arrival</td>
                        <td class="graph" style="width:5mm;">
                           <xsl:choose>
                              <xsl:when test="adcd:DocSign='1'">X</xsl:when>
                              <xsl:otherwise> </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td align="left" class="graph" style="width:25mm;">Departure</td>
                        <td class="graph" style="width:27.5mm;">Page №</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" colspan="2" style="width:77.5mm;">
                           <span class="graph">1. Name of ship</span>
                           <br/>
                           <xsl:value-of select="adcd:Vessel/catTrans_ru:Name"/>
                        </td>
                        <td align="left" class="graph" colspan="5" style="width:87.5mm;">
                           <span class="graph">2. Port where report is made</span>
                           <br/>
                           <xsl:if test="adcd:DeclarationPort">
                              <xsl:value-of select="adcd:DeclarationPort"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" style="width:35mm;">
                           <span class="graph">3. Nationality of ship</span>
                           <br/>
                           <xsl:if test="adcd:Vessel/catTrans_ru:NationalityCode">
                              <xsl:value-of select="adcd:Vessel/catTrans_ru:NationalityCode"/>
                           </xsl:if>
                        </td>
                        <td align="left" class="graph" style="width:42.5mm;">
                           <span class="graph">4. Name of master</span>
                           <br/>
                           <xsl:if test="adcd:Vessel/catTrans_ru:Shipmaster">
                              <xsl:value-of select="adcd:Vessel/catTrans_ru:Shipmaster"/>
                           </xsl:if>
                        </td>
                        <td align="left" class="graph" colspan="5" style="width:87.5mm;">
                           <span class="graph">5. Port of loading/Port of discharge</span>
                           <br/>
                           <xsl:value-of select="adcd:DepartDestinPort"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:15mm;">B/L № *</td>
                        <td align="left" class="graph" style="width:35mm;">6. Marks and Nos.</td>
                        <td align="left" class="graph" colspan="4" style="width:77.5mm;">7. Number and kind of packages;
description of goods</td>
                        <td align="left" class="graph" style="width:25mm;">8. Gross weight</td>
                        <td align="left" class="graph" style="width:27.5mm;">9. Measurement</td>
                     </tr>
                     <xsl:for-each select="adcd:Goods">
                        <tr>
                           <td align="left" class="graph" style="width:15mm;">
                              <xsl:if test="adcd:BillofLading/cat_ru:PrDocumentNumber">
                                 <xsl:value-of select="adcd:BillofLading/cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                           </td>
                           <td align="left" class="graph" style="width:35mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="cat_ru:GoodsMarking">
                                 <xsl:value-of select="cat_ru:GoodsMarking"/>
                              </xsl:if>
                           </td>
                           <td align="left" class="graph" colspan="4" style="width:77.5mm;">
                              <xsl:for-each select="adcd:PlacesInfo">
                                 <xsl:value-of select="catTrans_cu:PakingQuantity"/> 
									    <xsl:if test="catTrans_cu:PackingDescription">
                                    <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                 </xsl:if>
                                 <br/>
                              </xsl:for-each>
                              <xsl:for-each select="cat_ru:GoodsDescription">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()"> </xsl:if>
                              </xsl:for-each>
                           </td>
                           <td align="left" class="graph" style="width:25mm;">
                              <xsl:value-of select="adcd:GrossWeightQuantity"/>
                           </td>
                           <td align="left" class="graph" style="width:27.5mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="adcd:Dimensions">
                                 <xsl:value-of select="adcd:Dimensions"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <p align="left" class="graph">10. Date and signature by master, authorized agent or officer</p>
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <xsl:if test="adcd:DocumentSignature/cat_ru:PersonPost">
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonPost"/>
                           </xsl:if>
                           <br/>
                           <xsl:if test="adcd:DocumentSignature/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adcd:DocumentSignature/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <!--xsl:text>_____________</xsl:text-->
                           <u>
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:if test="adcd:DocumentSignature/cat_ru:PersonMiddleName">
                                 <xsl:value-of select="adcd:DocumentSignature/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                           </u>
                           <br/>
                           <span class="graph">(Signature,family name,initials)</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="graph">* Transport document №.</p>
               <p align="left" class="graph">Also state original ports of shipment in respect of goods shipped on multimodal transport document or through bills of lading.</p>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
