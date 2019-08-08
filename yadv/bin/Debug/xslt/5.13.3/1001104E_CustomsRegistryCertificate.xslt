<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:regcer="urn:customs.ru:Information:CustomsDocuments:CustomsRegistryCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="regcer:CustomsRegistryCertificate">
      <html>
         <head>
            <title>Свидетельство о включении в реестр уполномоченных экономических операторов/таможенных перевозчиков/владельцев СВХ/владельцев магазинов беспошлиной торговли</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <xsl:choose>
                  <xsl:when test="regcer:DocSign='1'">
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">СВИДЕТЕЛЬСТВО № 
									<xsl:value-of select="regcer:CertificateRegNumber"/>
                              <br/>         о включении в реестр уполномоченных экономических операторов
									</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:if test="regcer:IssueCustoms/cat_ru:OfficeName">
                                 <xsl:value-of select="regcer:IssueCustoms/cat_ru:OfficeName"/>, </xsl:if>
                              <xsl:value-of select="regcer:IssueCustoms/cat_ru:Code"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
								(наименование таможенного органа)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Настоящим подтверждается, что
									<u>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:OrganizationName">
                                    <xsl:value-of select="regcer:RegisteredOrganization/cat_ru:OrganizationName"/> </xsl:if>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:Address">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:Address"/>
                                 </xsl:if>
                                 <xsl:if test="regcer:RegisteredOrganization/regcer:BranchDescription">
                                    <b> Структурные подразделения: </b>
                                    <xsl:for-each select="regcer:RegisteredOrganization/regcer:BranchDescription">
                                       <xsl:value-of select="cat_ru:OrganizationName"/> <xsl:if test="cat_ru:Address">
                                          <xsl:apply-templates select="cat_ru:Address"/>
                                       </xsl:if>
                                       <xsl:if test="position()!=last()">; </xsl:if>
                                    </xsl:for-each>
                                 </xsl:if>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">(организационно-правовая форма, наименование, местонахождение юридического лица, сведения о наличии обособленных структурных
									 подразделений)</td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">включено в реестр уполномоченных экономических операторов.</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="33%">Предоставлены специальные упрощения </td>
                           <td class="graph" style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
                              <xsl:for-each select="regcer:Simplification">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()">, </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" colspan="2" style="border:solid 0pt">
									(специальные упрощения в соответствии с частью 1 статьи 86 Федерального закона от 29 ноября 2010 г. № 311-ФЗ "О таможенном 
									регулировании в Российской Федерации", предоставленные при включении в реестр уполномоченных экономических операторов)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Места совершения таможенных операций при применении специальных упрощений 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceDescription">
                                       <xsl:value-of select="regcer:PlaceDescription"/> </xsl:if>
                                    <xsl:apply-templates select="regcer:Address"/>
                                    <xsl:if test="position()!=last()">; </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">(местонахождение помещений, открытых площадок и иных территорий уполномоченного экономического оператора)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Таможенные органы, в которых могут производиться таможенные операции с товарами с применением специальных упрощений
									
											<xsl:for-each select="regcer:SimplificOperationCustoms">
                                 <xsl:if test="cat_ru:OfficeName">
                                    <xsl:value-of select="cat_ru:OfficeName"/> </xsl:if>
                                 <xsl:value-of select="cat_ru:Code"/>
                                 <xsl:if test="position()!=last()">; </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:solid 1pt #000000;border-left:solid 0pt;border-bottom:solid 0pt;border-right:solid 0pt">(наименования и коды таможенных органов)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Размер и способ обеспечения уплаты таможенных платежей 
									<u>
                                 <xsl:for-each select="regcer:Guarantee">
                                    <xsl:value-of select="regcer:PaymentWayCode"/> 
									<xsl:value-of select="regcer:Amount"/>
                                    <xsl:if test="regcer:Currency"> (<xsl:value-of select="regcer:Currency"/>)</xsl:if>
                                    <xsl:if test="position()!=last()">; </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonName"/>
                              <xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                              <!--<xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonPost">&#160;(<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonPost"/>)</xsl:if>-->
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
									(руководитель таможенного органа, подпись, инициалы, фамилия)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">М. П.</td>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">(гербовая печать ФТС России)</td>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="24%">Дата выдачи</td>
                           <td class="graph" style="border:solid 0pt" width="55%"> </td>
                           <td class="graph" style="border:solid 0pt" width="21">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="regcer:IssueDate"/>
                              </xsl:call-template>г.
									</td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="regcer:DocSign='2'">
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">СВИДЕТЕЛЬСТВО № 
									<xsl:value-of select="regcer:CertificateRegNumber"/>
                              <br/>         о включении в реестр таможенных перевозчиков
									</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:if test="regcer:IssueCustoms/cat_ru:OfficeName">
                                 <xsl:value-of select="regcer:IssueCustoms/cat_ru:OfficeName"/>, </xsl:if>
                              <xsl:value-of select="regcer:IssueCustoms/cat_ru:Code"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
								(наименование таможенного органа)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Настоящим подтверждается, что 
									<u>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:OrganizationName">
                                    <xsl:value-of select="regcer:RegisteredOrganization/cat_ru:OrganizationName"/> </xsl:if>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:Address">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:Address"/>
                                 </xsl:if>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">(организационно-правовая форма, наименование, местонахождение юридического лица, включенного в реестр таможенных перевозчиков)</td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">включено в реестр таможенных перевозчиков.</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Размер и способ обеспечения уплаты таможенных платежей 
									<u>
                                 <xsl:for-each select="regcer:Guarantee">
                                    <xsl:value-of select="regcer:PaymentWayCode"/> 
									<xsl:value-of select="regcer:Amount"/>
                                    <xsl:if test="regcer:Currency"> (<xsl:value-of select="regcer:Currency"/>)</xsl:if>
                                    <xsl:if test="position()!=last()">; </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonName"/>
                              <xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                              <!--<xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonPost">&#160;(<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonPost"/>)</xsl:if>-->
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
									(руководитель таможенного органа, подпись, инициалы, фамилия)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">М. П.</td>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">(гербовая печать таможенного органа)</td>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="30%">Дата выдачи</td>
                           <td class="graph" style="border:solid 0pt" width="49%"> </td>
                           <td class="graph" style="border:solid 0pt" width="21">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="regcer:IssueDate"/>
                              </xsl:call-template>г.
									</td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="regcer:DocSign='3'">
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">СВИДЕТЕЛЬСТВО № 
									<xsl:value-of select="regcer:CertificateRegNumber"/>
                              <br/>о включении в реестр владельцев складов временного хранения
									</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:if test="regcer:IssueCustoms/cat_ru:OfficeName">
                                 <xsl:value-of select="regcer:IssueCustoms/cat_ru:OfficeName"/>, </xsl:if>
                              <xsl:value-of select="regcer:IssueCustoms/cat_ru:Code"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
								(наименование таможни, выдавшей свидетельство)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Настоящим подтверждается, что
									
											<xsl:if test="regcer:RegisteredOrganization/cat_ru:OrganizationName">
                                 <xsl:value-of select="regcer:RegisteredOrganization/cat_ru:OrganizationName"/> </xsl:if>
                              <xsl:choose>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures"/>
                                 </xsl:when>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures"/>
                                 </xsl:when>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures"/>
                                 </xsl:when>
                              </xsl:choose>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">(организационно-правовая форма, полное наименование владельца склада, ИНН)</td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <xsl:if test="regcer:RegisteredOrganization/cat_ru:Address">
                                 <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:Address"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">(место нахождения владельца склада)</td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">включено в реестр владельцев складов временного хранения.</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt;">Тип склада временного хранения
										<u>
                                 <!--<xsl:choose>
														<xsl:when test="regcer:PlaceSign='3'">Открытая площадка.&#160;</xsl:when>
														<xsl:when test="regcer:PlaceSign='4'"> Помещение.&#160;</xsl:when>
													</xsl:choose>-->
                                 <xsl:choose>
                                    <xsl:when test="regcer:WarehouseType='0' or regcer:WarehouseType='f' or regcer:WarehouseType='false'">закрытого типа</xsl:when>
                                    <xsl:otherwise>открытого типа</xsl:otherwise>
                                 </xsl:choose>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:for-each select="regcer:GoodsOperationPlace">
                                 <xsl:if test="regcer:PlaceDescription">
                                    <xsl:value-of select="regcer:PlaceDescription"/>
                                 </xsl:if>
                                 <xsl:apply-templates select="regcer:Address"/>
                                 <xsl:if test="position()!=last()">; </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">(место нахождения помещения и (или) открытой площадки)</td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <xsl:for-each select="regcer:GoodsOperationPlace">
                                 <xsl:if test="regcer:PlaceSign">
                                    <!--<xsl:choose>
													<xsl:when test="regcer:PlaceSign='3'">&#160;Открытая площадка:</xsl:when>
													<xsl:when test="regcer:PlaceSign='4'">&#160;Помещение:</xsl:when>
												</xsl:choose>-->
                                    <xsl:if test="regcer:PlaceSquare">
													Площадь <xsl:value-of select="regcer:PlaceSquare"/>кв. м
														</xsl:if>
                                    <xsl:if test="regcer:PlaceVolume">
													Объем <xsl:value-of select="regcer:PlaceVolume"/>куб. м
														</xsl:if>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
									(полезный объем помещения и (или) полезная площадь открытой площадки)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt" width="22%">М. П.</td>
                           <td class="graph" style="border:solid 0pt" width="12%"> </td>
                           <td align="right" class="graph" style="border:solid 0pt" width="28%">Начальник таможни</td>
                           <td align="center" class="graph" style="border:solid 0pt" width="38%">
                              <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonName"/>
                              <xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                              <!--<xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonPost">&#160;(<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonPost"/>)</xsl:if>-->
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">(гербовая печать таможни)</td>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
									(подпись, фамилия, инициалы руководителя)
									</td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="3" style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="regcer:IssueDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="regcer:DocSign='4'">
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" colspan="2" style="border:solid 0pt">СВИДЕТЕЛЬСТВО № 
									<xsl:value-of select="regcer:CertificateRegNumber"/>
                              <br/>о включении в Реестр владельцев магазинов беспошлинной торговли
									</td>
                        </tr>
                        <tr>
                           <td colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="7%">Выдано</td>
                           <td class="graph" style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
                              <xsl:if test="regcer:IssueCustoms/cat_ru:OfficeName">
                                 <xsl:value-of select="regcer:IssueCustoms/cat_ru:OfficeName"/>, </xsl:if>
                              <xsl:value-of select="regcer:IssueCustoms/cat_ru:Code"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="7%"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(таможня)</td>
                        </tr>
                        <tr>
                           <td colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Кому
									
											<xsl:if test="regcer:RegisteredOrganization/cat_ru:OrganizationName">
                                 <xsl:value-of select="regcer:RegisteredOrganization/cat_ru:OrganizationName"/> </xsl:if>
                              <xsl:if test="regcer:RegisteredOrganization/cat_ru:Address">
                                 <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:Address"/> 
											</xsl:if>
                              <xsl:choose>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures"/>
                                 </xsl:when>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures"/>
                                 </xsl:when>
                                 <xsl:when test="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures"/>
                                 </xsl:when>
                              </xsl:choose>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">(владелец магазина беспошлинной торговли, юридический адрес, ИНН)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Место нахождения торгового зала магазина беспошлинной торговли 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='1'">
                                       <xsl:if test="regcer:PlaceDescription">
                                          <xsl:value-of select="regcer:PlaceDescription"/> </xsl:if>
                                       <xsl:apply-templates select="regcer:Address"/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Место нахождения склада магазина беспошлинной торговли 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='2'">
                                       <xsl:if test="regcer:PlaceDescription">
                                          <xsl:value-of select="regcer:PlaceDescription"/> </xsl:if>
                                       <xsl:apply-templates select="regcer:Address"/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Общая площадь магазина беспошлинной торговли (кв. м)
									<u>
                                 <xsl:if test="regcer:TotalSquare">
                                    <xsl:value-of select="regcer:TotalSquare"/>
                                 </xsl:if>
                              </u>, <br/>в том числе торговый зал (кв. м) 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='1'">
                                       <xsl:if test="regcer:PlaceSquare">
                                          <xsl:value-of select="regcer:PlaceSquare"/>
                                       </xsl:if>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>, <br/>склад (кв. м) 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='2'">
                                       <xsl:if test="regcer:PlaceSquare">
                                          <xsl:value-of select="regcer:PlaceSquare"/>
                                       </xsl:if>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="18%">Начальник таможни</td>
                           <td style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;" width="20%"> </td>
                           <td style="border:solid 0pt" width="10%"> </td>
                           <td align="center" class="graph" style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;" width="49%">
                              <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonName"/>
                              <xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                              <!--<xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonPost">&#160;(<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonPost"/>)</xsl:if>-->
                           </td>
                           <td style="border:solid 0pt" width="3%"> </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(подпись)</td>
                           <td style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(инициалы и фамилия)</td>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">М. П.</td>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="regcer:IssueDate"/>
                              </xsl:call-template>г.
									</td>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="regcer:DocSign='5'">
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td align="center" class="graph" colspan="2" style="border:solid 0pt">СВИДЕТЕЛЬСТВО № 
									<xsl:value-of select="regcer:CertificateRegNumber"/>
                              <br/>о включении в Реестр владельцев таможенных складов
									</td>
                        </tr>
                        <tr>
                           <td colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="7%">Выдано</td>
                           <td class="graph" style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;">
                              <xsl:if test="regcer:IssueCustoms/cat_ru:OfficeName">
                                 <xsl:value-of select="regcer:IssueCustoms/cat_ru:OfficeName"/>, </xsl:if>
                              <xsl:value-of select="regcer:IssueCustoms/cat_ru:Code"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="7%"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(таможня)</td>
                        </tr>
                        <tr>
                           <td colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Кому
									<u>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:OrganizationName">
                                    <xsl:value-of select="regcer:RegisteredOrganization/cat_ru:OrganizationName"/> </xsl:if>
                                 <xsl:if test="regcer:RegisteredOrganization/cat_ru:Address">
                                    <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:Address"/> 
											</xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures">
                                       <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RFOrganizationFeatures"/>
                                    </xsl:when>
                                    <xsl:when test="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures">
                                       <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RKOrganizationFeatures"/>
                                    </xsl:when>
                                    <xsl:when test="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures">
                                       <xsl:apply-templates select="regcer:RegisteredOrganization/cat_ru:RBOrganizationFeatures"/>
                                    </xsl:when>
                                 </xsl:choose>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">(владелец таможенного склада, юридический адрес, ИНН)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="20%">Тип таможенного склада</td>
                           <td class="graph" style="border:solid 0pt" width="80%">
                              <xsl:if test="regcer:WarehouseType">
                                 <xsl:choose>
                                    <xsl:when test="regcer:WarehouseType='1' or regcer:WarehouseType='t' or regcer:WarehouseType='true'">открытый</xsl:when>
                                    <xsl:when test="regcer:WarehouseType='0' or regcer:WarehouseType='f' or regcer:WarehouseType='false'"> закрытый</xsl:when>
                                 </xsl:choose>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="20%"> </td>
                           <td align="center" class="graph" style="border-top:1px solid #000000; border-bottom:0px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;" width="80%">(открытый/закрытый)
									</td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Местонахождение помещения и (или) открытой площадки таможенного склада 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign">
                                       <xsl:choose>
                                          <xsl:when test="regcer:PlaceSign='3'">Открытая площадка. </xsl:when>
                                          <xsl:when test="regcer:PlaceSign='4'"> Помещение. </xsl:when>
                                       </xsl:choose>
                                    </xsl:if>
                                    <xsl:if test="regcer:PlaceDescription">
                                       <xsl:value-of select="regcer:PlaceDescription"/>
                                    </xsl:if>
                                    <xsl:apply-templates select="regcer:Address"/>
                                    <xsl:if test="position()!=last()">; </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Общая площадь таможенного склада (кв. м)
									<u>
                                 <xsl:if test="regcer:TotalSquare">
                                    <xsl:value-of select="regcer:TotalSquare"/>
                                 </xsl:if>
                              </u>, <br/>в том числе полезный объем помещения (кб. м) 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='4'">
                                       <xsl:if test="regcer:PlaceVolume">
                                          <xsl:value-of select="regcer:PlaceVolume"/>
                                       </xsl:if>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>
                              <br/>полезная площадь открытой площадки (кв. м) 
									<u>
                                 <xsl:for-each select="regcer:GoodsOperationPlace">
                                    <xsl:if test="regcer:PlaceSign='3'">
                                       <xsl:if test="regcer:PlaceSquare">
                                          <xsl:value-of select="regcer:PlaceSquare"/>
                                       </xsl:if>
                                    </xsl:if>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td class="graph" style="border:solid 0pt" width="18%">Начальник таможни</td>
                           <td style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;" width="20%"> </td>
                           <td style="border:solid 0pt" width="10%"> </td>
                           <td align="center" class="graph" style="border-top:0px solid #000000; border-bottom:1px solid #000000; border-left:0px solid #000000; border-right:0px solid #000000;" width="49%">
                              <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonName"/>
                              <xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                              <!--<xsl:if test="regcer:ChiefCustomsPerson/cat_ru:PersonPost">&#160;(<xsl:value-of select="regcer:ChiefCustomsPerson/cat_ru:PersonPost"/>)</xsl:if>-->
                           </td>
                           <td style="border:solid 0pt" width="3%"> </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(подпись)</td>
                           <td style="border:solid 0pt"> </td>
                           <td align="center" class="graph" style="border:solid 0pt">(инициалы и фамилия)</td>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">М. П.</td>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 0pt">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="regcer:IssueDate"/>
                              </xsl:call-template>г.
									</td>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                     </table>
                  </xsl:when>
               </xsl:choose>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:Address | regcer:Address">
	Адрес: 
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
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
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <!--<xsl:if test="cat_ru:OGRN">
		<span>ОГРН: <xsl:value-of select="cat_ru:OGRN" /></span><br/>
	</xsl:if>-->
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span> 
	</xsl:if>
      <!--<xsl:if test="cat_ru:KPP">
		<span>	КПП: <xsl:value-of select="cat_ru:KPP" /></span><br/>
	</xsl:if>-->
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <!--<xsl:if test="cat_ru:UNP">
		<span>УНП: <xsl:value-of select="cat_ru:UNP" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber" /></span>&#160;
	</xsl:if>-->
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <!--<xsl:if test="cat_ru:BIN">
		<span>БИН: <xsl:value-of select="cat_ru:BIN" /></span><br/>
	</xsl:if>-->
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span> 
	</xsl:if>
      <!--<xsl:for-each select="cat_ru:ITN">
		<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode" />/<xsl:value-of select="cat_ru:KATOCode" />/<xsl:value-of select="cat_ru:RNN" /><xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
			</span><br/>
	</xsl:for-each>-->
   </xsl:template>
</xsl:stylesheet>
