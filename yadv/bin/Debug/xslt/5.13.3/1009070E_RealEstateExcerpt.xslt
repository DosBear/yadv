<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ree="urn:customs.ru:Information:SQDocuments:RealEstateExcerpt:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ree:RealEstateExcerpt">
      <html>
         <head>
            <title>Запрос сведений из Единого государственного реестра прав на недвижимое имущество и сделок с ним</title>
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
               <table>
                  <xsl:for-each select="ree:RequestData">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">
                           <font face="Times new roman" size="4">
                              <b>Запрос сведений из Единого государственного реестра прав на недвижимое имущество и сделок с ним.<br/>Выписка из Единого государственного реестра
						<xsl:choose>
                                    <xsl:when test="ree:RequestSign=1"> об объекте недвижимости</xsl:when>
                                    <xsl:when test="ree:RequestSign=2"> о правах отдельного лица на имеющиеся у него объекты недвижимого имущества</xsl:when>
                                    <xsl:when test="ree:RequestSign=3">. Cведения по документу</xsl:when>
                                    <xsl:when test="ree:RequestSign=4"> о признании правообладателя недееспособным или ограниченно дееспособным</xsl:when>
                                 </xsl:choose>
                              </b>
                           </font>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <xsl:if test="ree:EstateObject">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Объект недвижимости</u>:<br/>
                              <xsl:apply-templates select="ree:EstateObject"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:Owner">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Владелец объекта недвижимого имущества</u>:<br/>
                              <xsl:apply-templates select="ree:Owner"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:Territory">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Территория РФ</u>:
						<xsl:if test="ree:Territory/ree:IsRussiaTerritory='1' or ree:Territory/ree:IsRussiaTerritory='t' or ree:Territory/ree:IsRussiaTerritory='true'"> по всей территории РФ</xsl:if>
                              <xsl:if test="ree:Territory/ree:IsRussiaTerritory='0' or ree:Territory/ree:IsRussiaTerritory='f' or ree:Territory/ree:IsRussiaTerritory='false'"> не по всей территории РФ</xsl:if>
                              <br/>
                              <xsl:for-each select="ree:Territory/ree:RegionCode">Регион (код): <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:RequestPeriod">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Период времени, за который необходимо предоставить сведения</u>:<br/>
						Начало периода: 
						<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ree:RequestPeriod/ree:StartDate"/>
                              </xsl:call-template>
                              <br/>
		Конец периода: 
						<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ree:RequestPeriod/ree:EndDate"/>
                              </xsl:call-template>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:DocRequest">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Запрос документа</u>:<br/>
                              <xsl:for-each select="ree:DocRequest">
                                 <xsl:choose>
                                    <xsl:when test="ree:ReqSign=1">Запрос копии документа (Указываются вид (наименование) и реквизиты договора (сделки))</xsl:when>
                                    <xsl:when test="ree:ReqSign=2">Справка о содержании правоустанавливающих документов</xsl:when>
                                 </xsl:choose>
                                 <br/>
                                 <xsl:if test="ree:DescribeContract">
						Положения, интересующие заявителя: <xsl:value-of select="ree:DescribeContract"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:apply-templates select="ree:IdentityDoc"/>
                                 <xsl:for-each select="ree:Object">
						Объект<br/>
                                    <xsl:apply-templates select="."/>
                                    <xsl:if test="position()!=last()">
                                       <tr>
                                          <td class="graph" style="border:solid 0pt"> </td>
                                       </tr>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <br/>
                                 <xsl:if test="ree:DocumentDetails">
						Реквизиты документа: 
						<xsl:if test="ree:DocumentDetails/cat_ru:PrDocumentName">
                                       <xsl:value-of select="ree:DocumentDetails/cat_ru:PrDocumentName"/>
                                    </xsl:if>
                                    <xsl:if test="ree:DocumentDetails/cat_ru:PrDocumentNumber"> №<xsl:value-of select="ree:DocumentDetails/cat_ru:PrDocumentNumber"/>
                                    </xsl:if>
                                    <xsl:if test="ree:DocumentDetails/cat_ru:PrDocumentDate"> 
						(<xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ree:DocumentDetails/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>)
						</xsl:if>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="position()!=last()">
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                  </xsl:for-each>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Сведения об организации, запрашивающей сведения</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:apply-templates select="ree:RequestPerson"/>
                        <br/>
				Вид заявителя: <xsl:value-of select="ree:RequestPerson/ree:PersonKind"/>
                        <br/>
				Признак подтверждения личности заявителя: 
				<xsl:if test="ree:RequestPerson/ree:IdentificationSign='1' or ree:RequestPerson/ree:IdentificationSign='t' or ree:RequestPerson/ree:IdentificationSign='true'"> истина</xsl:if>
                        <xsl:if test="ree:RequestPerson/ree:IdentificationSign='0' or ree:RequestPerson/ree:IdentificationSign='f' or ree:RequestPerson/ree:IdentificationSign='false'"> ложь</xsl:if>
                        <br/>
                        <xsl:if test="ree:RequestPerson/ree:Agent">
                           <xsl:apply-templates select="ree:RequestPerson/ree:Agent"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Оплата</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Право на безвозмездное предоставление сведений в соответствии со статьей 8 Закона о регистрации (122-ФЗ):
				<xsl:if test="ree:Payment/ree:FreeServiceSign='1' or ree:Payment/ree:FreeServiceSign='t' or ree:Payment/ree:FreeServiceSign='true'"> есть</xsl:if>
                        <xsl:if test="ree:Payment/ree:FreeServiceSign='0' or ree:Payment/ree:FreeServiceSign='f' or ree:Payment/ree:FreeServiceSign='false'"> нет</xsl:if>
                        <br/>
                     </td>
                  </tr>
                  <xsl:if test="ree:Payment/ree:ReasonsDocuments">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Документы основания получение сведений без оплаты:<br/>
                           <xsl:for-each select="ree:Payment/ree:ReasonsDocuments">
                              <xsl:apply-templates select="."/>
                              <xsl:if test="position()!=last()">
                                 <tr>
                                    <td class="graph" style="border:solid 0pt"> </td>
                                 </tr>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Способ обмена информацией</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <table>
                           <tr>
                              <td class="graph" style="border:solid 1pt #000000" width="40%">Отправка XML-документа с использованием вэб-сервисов</td>
                              <td class="graph" style="border:solid 1pt #000000">
                                 <xsl:if test="ree:Delivery/ree:WebService='1' or ree:Delivery/ree:WebService='t' or ree:Delivery/ree:WebService='true'">Да</xsl:if>
                                 <xsl:if test="ree:Delivery/ree:WebService='0' or ree:Delivery/ree:WebService='f' or ree:Delivery/ree:WebService='false'">Нет</xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="border:solid 1pt #000000">Межведомственный запрос</td>
                              <td class="graph" style="border:solid 1pt #000000">
                                 <xsl:if test="ree:Delivery/ree:InterDepartmentRequest='1' or ree:Delivery/ree:InterDepartmentRequest='t' or ree:Delivery/ree:InterDepartmentRequest='true'">Да</xsl:if>
                                 <xsl:if test="ree:Delivery/ree:InterDepartmentRequest='0' or ree:Delivery/ree:InterDepartmentRequest='f' or ree:Delivery/ree:InterDepartmentRequest='false'">Нет</xsl:if>
                              </td>
                           </tr>
                           <xsl:if test="ree:Delivery/ree:NameOKU">
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">В виде бумажного документа при личном обращении</td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="ree:Delivery/ree:NameOKU"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="ree:Delivery/ree:PostAddress">
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">В виде бумажного документа посредством почтового отправления</td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="ree:Delivery/ree:PostAddress"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="ree:Delivery/ree:EmailAddress">
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">В виде электронного документа посредством электронной почты</td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="ree:Delivery/ree:EmailAddress"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="ree:Delivery/ree:LinkEmail">
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">В виде ссылки на электронный документ посредством электронной почты</td>
                                 <td class="graph" style="border:solid 1pt #000000">
                                    <xsl:value-of select="ree:Delivery/ree:LinkEmail"/>
                                 </td>
                              </tr>
                           </xsl:if>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="ree:AppliedDocuments">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">
                           <font face="Times new roman" size="4">
                              <b>Сведения о приложенных документах</b>
                           </font>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <xsl:for-each select="ree:AppliedDocuments">
                              <xsl:apply-templates select="."/>
                              <xsl:if test="position()!=last()">
                                 <tr>
                                    <td class="graph" style="border:solid 0pt"> </td>
                                 </tr>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ree:MunicipalService">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">
                           <font face="Times new roman" size="4">
                              <b>Государственная или муниципальная услуга</b>
                           </font>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <table>
                              <xsl:if test="ree:MunicipalService/ree:BaseRequest">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Основание запроса сведений</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="ree:MunicipalService/ree:BaseRequest"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="ree:MunicipalService/ree:NormativeAct">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Положение нормативного акта</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="ree:MunicipalService/ree:NormativeAct"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="ree:MunicipalService/ree:Post">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Должность</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="ree:MunicipalService/ree:Post"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="ree:MunicipalService/ree:AnswerDate">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Срок ожидаемого ответа на межведомственный запрос</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ree:MunicipalService/ree:AnswerDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="ree:MunicipalService/ree:ServiceName">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Наименование услуги</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="ree:MunicipalService/ree:ServiceName"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="ree:MunicipalService/ree:ServiceCode">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Код услуги</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="ree:MunicipalService/ree:ServiceCode"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                           </table>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ree:Owner | ree:RequestPerson | ree:Agent">
      <table>
         <tr>
            <td class="graph" colspan="2" style="border:solid 0pt">
               <xsl:value-of select="cat_ru:OrganizationName"/>
               <xsl:if test="cat_ru:ShortName">
                  <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
                  <xsl:value-of select="cat_ru:ShortName"/>
                  <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
               </xsl:if>
               <br/>
               <xsl:choose>
                  <xsl:when test="cat_ru:RFOrganizationFeatures">
                     <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
                  </xsl:when>
                  <xsl:when test="cat_ru:RKOrganizationFeatures">
                     <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
                  </xsl:when>
                  <xsl:when test="cat_ru:RBOrganizationFeatures">
                     <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
                  </xsl:when>
               </xsl:choose>
               <xsl:if test="cat_ru:Address">
                  <xsl:apply-templates select="cat_ru:Address"/>
               </xsl:if>
               <xsl:if test="cat_ru:IdentityCard">
                  <xsl:apply-templates select="cat_ru:IdentityCard"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 0pt"> </td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000" width="50%">Признак</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:choose>
                  <xsl:when test="ree:OrgSign=1">Физическое лицо</xsl:when>
                  <xsl:when test="ree:OrgSign=2">Юридическое лицо</xsl:when>
                  <xsl:when test="ree:OrgSign=3">Орган государственной власти или орган местного самоуправления</xsl:when>
                  <xsl:when test="ree:OrgSign=4">Иностранное юридическое лицо</xsl:when>
               </xsl:choose>
            </td>
         </tr>
         <xsl:if test="ree:BirthDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата рождения</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ree:BirthDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="cat_ru:Contact/cat_ru:Phone">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Номер телефона</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="cat_ru:Contact/cat_ru:E_mail">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Адрес электронной почты</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="cat_ru:Contact/cat_ru:E_mail"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:InsuranceNumber">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">СНИЛС</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:InsuranceNumber"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:RegDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата государственной регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ree:RegDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:PreviousName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Предыдущее наименование</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="ree:PreviousName">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:GovernanceCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Тип органа государственной власти или органа местного самоуправления</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:GovernanceCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:RegCountry">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Страна регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:RegCountry"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:RegNum">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Номер регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:RegNum"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ID">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Внутренний идентификатор</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ID"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ContactInfo">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Контактная информация</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ContactInfo"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:EgrpID">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Идентификатор в базе данных ЕГРП</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:EgrpID"/>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Вид представительства</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:value-of select="ree:AgentKind"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 0pt"> </td>
         </tr>
         <xsl:if test="ree:FactAddress">
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt">Адрес преимущественного проживания субъекта / Зарегистрированный адрес субъекта:</td>
            </tr>
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt">
                  <xsl:apply-templates select="ree:FactAddress"/>
               </td>
            </tr>
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt"> </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:PreviousIdentityDocs">
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt">Предыдущие документы<br/>
                  <xsl:for-each select="ree:PreviousIdentityDocs">
                     <xsl:value-of select="position()"/>.
				<xsl:apply-templates select="."/>
                     <xsl:if test="position()!=last()">
                        <tr>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:PresentedDocs">
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt">Представленные документы<br/>
                  <xsl:for-each select="ree:PresentedDocs">
                     <xsl:value-of select="position()"/>.
				<xsl:apply-templates select="."/>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                     </tr>
                     <xsl:if test="ree:Register">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Регистратор (ФИО нотариуса)</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:Register"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:Note">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Особые отметки</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:Note"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:StartDate">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Дата начала действия</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ree:StartDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:EndDate">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Дата прекращения действия</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ree:EndDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:ImageFile">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Имя файла с изображением</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:ImageFile"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:ImageReference">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Электронный адрес изображения</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:ImageReference"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:RegDate">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Дата государственной регистрации</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ree:RegDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:RegNum">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Номер регистрации</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:RegNum"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:AppendFileType">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Тип  приложенного файла по классификатору</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:AppendFileType"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:AppendFileName">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Имя приложенного файла</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="ree:AppendFileName"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ree:Quantity">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000">Количество</td>
                           <td class="graph" style="border:solid 1pt #000000">
                              <xsl:for-each select="ree:Quantity">
                                 <xsl:if test="ree:OriginalSign">
                                    <xsl:if test="ree:OriginalSign='1' or ree:OriginalSign='t' or ree:OriginalSign='true'">Подлинник</xsl:if>
                                    <xsl:if test="ree:OriginalSign='0' or ree:OriginalSign='f' or ree:OriginalSign='false'">Копия</xsl:if>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="ree:Quantity">
				Кол-во экземпляров: <xsl:value-of select="ree:Quantity"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="ree:SheetQuantity">Количество листов: <xsl:value-of select="ree:SheetQuantity"/>
                                 </xsl:if>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="position()!=last()">
                        <tr>
                           <td class="graph" colspan="2" style="border:solid 0pt"> </td>
                        </tr>
                     </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="ree:ReasonsDocuments | ree:AppliedDocuments">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
      <table>
         <xsl:if test="ree:Register">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Регитсратор (ФИО нотариуса)</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:Register"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:Note">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Особые отметки</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:Note"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:StartDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата начала действия</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ree:StartDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:EndDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата прекращения действия</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ree:EndDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ImageFile">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Имя файла с изображением</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ImageFile"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ImageReference">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Электронный адрес изображения</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ImageReference"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:RegDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата государственной регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ree:RegDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:RegNum">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Номер регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:RegNum"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:AppendFileType">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Тип  приложенного файла по классификатору</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:AppendFileType"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:AppendFileName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Имя приложенного файла</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:AppendFileName"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:Quantity">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Количество</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="ree:Quantity">
                     <xsl:if test="ree:OriginalSign">
                        <xsl:if test="ree:OriginalSign='1' or ree:OriginalSign='t' or ree:OriginalSign='true'">Подлинник</xsl:if>
                        <xsl:if test="ree:OriginalSign='0' or ree:OriginalSign='f' or ree:OriginalSign='false'">Копия</xsl:if>
                        <br/>
                     </xsl:if>
                     <xsl:if test="ree:Quantity">
				Кол-во экземпляров: <xsl:value-of select="ree:Quantity"/>
                        <br/>
                     </xsl:if>
                     <xsl:if test="ree:SheetQuantity">Количество листов: <xsl:value-of select="ree:SheetQuantity"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()">
                        <br/>
                     </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="position()!=last()">
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt"> </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="ree:EstateObject | ree:Object">
      <table>
         <tr>
            <td class="graph" style="border:solid 1pt #000000" width="30%">Тип объекта</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:if test="ree:ObjectSign='1'">Объект недвижимости</xsl:if>
               <xsl:if test="ree:ObjectSign='0'">Земельный участок</xsl:if>
            </td>
         </tr>
         <xsl:if test="ree:EstateObjectSign">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Тип объекта недвижимости</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:choose>
                     <xsl:when test="ree:EstateObjectSign=1">Помещение</xsl:when>
                     <xsl:when test="ree:EstateObjectSign=2">Здание</xsl:when>
                     <xsl:when test="ree:EstateObjectSign=3">Иное</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:IsRoom">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Признак, является ли помещение комнатой</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="ree:IsRoom='1' or ree:IsRoom='t' or ree:IsRoom='true'">Да</xsl:if>
                  <xsl:if test="ree:IsRoom='0' or ree:IsRoom='f' or ree:IsRoom='false'">Нет</xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:HousingSign">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Признак</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="ree:HousingSign='1' or ree:HousingSign='t' or ree:HousingSign='true'">Нежилое</xsl:if>
                  <xsl:if test="ree:HousingSign='0' or ree:HousingSign='f' or ree:HousingSign='false'">Жилое (квартира, жилой дом)</xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:AreaValue">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Площадь объекта</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:AreaValue"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:AreaUnit">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Единица измерения площади</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:AreaUnit"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ObjectDescription">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Описание объекта</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ObjectDescription"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:CadastrNumber">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Кадастровый номер</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:CadastrNumber"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:AdditionalInfo">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дополнительная информация</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:AdditionalInfo"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ID">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Внутренний идентификатор</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ID"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:ConditionCadastrNum">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Условный кадастровый номер</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="ree:ConditionCadastrNum"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="ree:Address">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Адрес объекта</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:apply-templates select="ree:Address"/>
               </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="ree:Address | cat_ru:Address | ree:FactAddress">
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
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <xsl:if test="ree:KLADRCode">
         <br/>Код адреса по КЛАДР: <xsl:value-of select="ree:KLADRCode"/>
      </xsl:if>
      <xsl:if test="ree:OKATO">
         <br/>ОКАТО: <xsl:value-of select="ree:OKATO"/>
      </xsl:if>
      <xsl:if test="ree:UnformalizedDescription">
         <br/>Неформализованное описание: <xsl:value-of select="ree:UnformalizedDescription"/>
      </xsl:if>
      <br/>
      <xsl:if test="ree:District">
         <xsl:apply-templates select="ree:District"/>
      </xsl:if>
      <br/>
      <xsl:if test="ree:UrbanDistrict">
         <xsl:apply-templates select="ree:UrbanDistrict"/>
      </xsl:if>
      <br/>
      <xsl:if test="ree:RuralPlace">
         <xsl:apply-templates select="ree:RuralPlace"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ree:District | ree:UrbanDistrict | ree:RuralPlace">
      <span class="graf">
Тип адресного элемента: <xsl:value-of select="ree:Type"/>
         <br/>
Наименование адресного элемента: <xsl:value-of select="ree:Name"/>
      </span>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard | ree:PreviousIdentityDocs | ree:PresentedDocs | ree:IdentityDoc">
Документ удостоверяющий личность:<br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
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
</xsl:stylesheet>
