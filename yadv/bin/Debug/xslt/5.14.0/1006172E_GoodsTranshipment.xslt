<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gtsh="urn:customs.ru:Information:CustomsDocuments:GoodsTranshipment:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="gtsh:GoodsTranshipment">
      <html>
         <head>
			<title>Уведомление о проведении грузовых операций</title>
            <!--xsl:choose>
               <xsl:when test="gtsh:DocumentDirection ='1'">
                  <title>Уведомление о проведении грузовых операций</title>
               </xsl:when>
               <xsl:otherwise>
                  <title>Заявление о необходимости проведения грузовых операций</title>
               </xsl:otherwise>
            </xsl:choose-->
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					.page {
                        width: 210mm;
                        /*height: 297mm;*/
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    table {
						width: 100%;
						margin-top: 15px;
                    }
                    
                    th {
						font-size: 13pt;
                    }
                   </style>
         </head>
         <body>
            <div class="page">
               <h1 align="center" style="font: 15pt; font-weight:bold">
				   Уведомление о проведении грузовых операций
                  <!--xsl:choose>
                     <xsl:when test="gtsh:DocumentDirection ='1'">
								Уведомление о проведении грузовых операций
							</xsl:when>
                     <xsl:otherwise>Заявление о необходимости проведения грузовых операций</xsl:otherwise>
                  </xsl:choose-->
               </h1>
               <div align="right">
                  <table border="1" style="margin-top:20px; width:60mm; border:0">
                     <tbody>
                        <tr>
                           <td align="center" style="border-right:0; border-left:0; border-top:0">
                              <!--<xsl:apply-templates select="gtsh:TD"/>-->
                              <xsl:choose>
                                 <xsl:when test="gtsh:TD">
											Номер транзитной декларации:
											
												<xsl:value-of select="gtsh:TD/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="dategtd" select="gtsh:TD/cat_ru:RegistrationDate"/>
                                    </xsl:call-template>/<xsl:value-of select="gtsh:TD/cat_ru:GTDNumber"/>
                                 </xsl:when>
                                 <xsl:otherwise>
											Номер книжки МДП:
											
												<xsl:value-of select="gtsh:TIRID/gtsh:TIRSeries"/>
                                    <xsl:value-of select="gtsh:TIRID/gtsh:TIRID"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <xsl:if test="gtsh:ReloadPlace">
                  <b>Место проведения грузовых и иных операций:</b>
                  <br/>
                  <xsl:apply-templates select="gtsh:ReloadPlace"/>
                  <br/>
               </xsl:if>
               <br/>
               <xsl:apply-templates select="gtsh:IncidentInfo"/>
               <br/>
               <xsl:if test="gtsh:Transport">
                  <b>Сведения о новом составе транспортных средств после проведения грузовых операций</b>
                  <br/>
                  <xsl:for-each select="gtsh:Transport">
                     <xsl:value-of select="position()"/>. 
							<xsl:if test="cat_ru:TransportIdentifier">
								Идентиф. <xsl:value-of select="cat_ru:TransportIdentifier"/>
                        <xsl:if test="cat_ru:TransportMeansNationalityCode">(<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>)</xsl:if>; 
							</xsl:if>
                     <xsl:if test="cat_ru:ActiveTransportIdentifier">
								индентиф. активного ТС 
								<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>; 
							</xsl:if>
							код вида ТС <xsl:value-of select="gtsh:Mode"/>
                     <br/>
                  </xsl:for-each>
                  <br/>
               </xsl:if>
               <xsl:if test="gtsh:Consignment">
                  <b>Товаротранспортная накладная:</b>
                  <br/>
                  <xsl:for-each select="gtsh:Consignment">
                     <xsl:value-of select="position()"/>. 
							<xsl:if test="gtsh:RegNumber">Номер накладной <xsl:value-of select="gtsh:RegNumber"/>
                        <br/>
                     </xsl:if>
							Описание товаров 
							<table border="1" cellpadding="0" cellspacing="0" style="margin-top: 0mm; margin-bottom: 2mm">
                        <tbody>
                           <tr>
                              <td>№ п/п</td>
                              <xsl:if test="//gtsh:GoodsDescription">
                                 <td>Наименование</td>
                              </xsl:if>
                              <xsl:if test="//gtsh:GrossWeightQuantity">
                                 <td>Вес товара, брутто (кг)</td>
                              </xsl:if>
                              <xsl:if test="//gtsh:Container">
                                 <td>Контейнеры</td>
                              </xsl:if>
                           </tr>
                           <xsl:for-each select="gtsh:GoodsItem">
                              <tr>
                                 <td>
                                    <xsl:value-of select="gtsh:GoodsNumber"/>
                                 </td>
                                 <xsl:if test="//gtsh:GoodsDescription">
                                    <td>
                                       <xsl:for-each select="gtsh:GoodsDescription">
                                          <xsl:value-of select="."/>
                                       </xsl:for-each>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="//gtsh:GrossWeightQuantity">
                                    <td>
                                       <xsl:value-of select="gtsh:GrossWeightQuantity"/>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="//gtsh:Container">
                                    <td>
                                       <xsl:for-each select="gtsh:Container">
                                          <xsl:if test="catESAD_cu:ContainerQuantity">
															Количество: <xsl:value-of select="catESAD_cu:ContainerQuantity"/>
                                             <br/>
                                          </xsl:if>
														Номер(а): 
														<xsl:for-each select="catESAD_cu:ContainerNumber">
                                             <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>; 
														</xsl:for-each>
                                          <br/>
                                          <br/>
                                       </xsl:for-each>
                                    </td>
                                 </xsl:if>
                              </tr>
                           </xsl:for-each>
                        </tbody>
                     </table>
                  </xsl:for-each>
                  <br/>
               </xsl:if>
			  <xsl:if test="gtsh:Seal">
				 <b>Информация о вновь наложенных пломбах, печатях и иных средствах идентификации </b>
				 <table border="1" cellpadding="0" cellspacing="0" style="margin-top:0" width="80%">
					<tbody>
					   <tr>
						  <td>Номер</td>
						  <td>Вид</td>
						  <xsl:if test="//gtsh:Identprevious">
							  <td>Признак снятия<br/>ранее наложенных<br/>средств идентификации</td>
						  </xsl:if>
						  <xsl:if test="//gtsh:IdentDesc">
							 <td>Примечание</td>
						  </xsl:if>
						  <xsl:if test="//gtsh:Quantity">
							 <td>Количество</td>
						  </xsl:if>
					   </tr>
					   <xsl:for-each select="gtsh:Seal">
						  <tr>
							 <td>
								<xsl:value-of select="gtsh:IdentNumber"/>
							 </td>
							 <td>
								<xsl:choose>
								   <xsl:when test="gtsh:IdentKind = '1'">пломба</xsl:when>
								   <xsl:when test="gtsh:IdentKind = '2'">печать</xsl:when>
								   <xsl:when test="gtsh:IdentKind = '3'">иное</xsl:when>
								</xsl:choose>
							 </td>
							 <xsl:if test="//gtsh:Identprevious">
								 <td>
									 <xsl:choose>
										<xsl:when test="gtsh:Identprevious='0'">без снятия</xsl:when>
										<xsl:when test="gtsh:Identprevious='1'">со снятием</xsl:when>
									</xsl:choose>
								 </td>
							 </xsl:if>
							 <xsl:if test="//gtsh:IdentDesc">
								<td>
								   <xsl:value-of select="gtsh:IdentDesc"/>
								</td>
							 </xsl:if>
							 <xsl:if test="//gtsh:Quantity">
								<td>
								   <xsl:value-of select="gtsh:Quantity"/>
								</td>
							 </xsl:if>
						  </tr>
					   </xsl:for-each>
					</tbody>
				 </table>
			  </xsl:if>
			  <xsl:apply-templates select="gtsh:CustomsPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gtsh:TD">
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="gtsh:CustomsPerson">
      <table border="1" style="margin-top:50px; width:100%; border: 0">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="15%"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="30%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0; font:12">(Ф.И.О.)</td>
               <td style="border:0;" width="15%"/>
               <td align="center" style="border:0; font:12">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gtsh:ReloadPlace">
      <xsl:choose>
         <xsl:when test="cat_ru:OfficeName">
            <xsl:value-of select="cat_ru:OfficeName"/>  
			(<xsl:value-of select="cat_ru:Code"/>)
		</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="cat_ru:Code"/>
         </xsl:otherwise>
      </xsl:choose>; 
	
	<xsl:if test="gtsh:BorderPointCode">
		Код пункта пропуска: <xsl:value-of select="gtsh:BorderPointCode"/>; 
	</xsl:if>
	<xsl:if test="gtsh:TranshipmentKind">
		Вид грузовых операций:
			<xsl:choose>
				<xsl:when test="gtsh:TranshipmentKind='0'">разгрузка</xsl:when>
				<xsl:when test="gtsh:TranshipmentKind='1'">перегрузка</xsl:when>
				<xsl:when test="gtsh:TranshipmentKind='2'">замена ТС</xsl:when>
			</xsl:choose>
		<xsl:text>;</xsl:text>
	</xsl:if>
      <xsl:for-each select="gtsh:RWStation">
         <xsl:if test="gtsh:StationName">
			Название станции <xsl:value-of select="gtsh:StationName"/>;  
		</xsl:if>
		код станции <xsl:value-of select="gtsh:StationCode"/>; 
		<xsl:if test="gtsh:RailwayCode">
			код дороги: <xsl:value-of select="gtsh:RailwayCode"/>;
         </xsl:if>
	</xsl:for-each>
	<xsl:if test="gtsh:Address">
		Адрес:
		<xsl:for-each select="gtsh:Address">
			<xsl:apply-templates mode="commaSeparated"/>
		</xsl:for-each>
	</xsl:if>.
   </xsl:template>
   <xsl:template match="gtsh:AccidentPlace">
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
      </xsl:if>.
	<xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="gtsh:IncidentInfo">
      <b>Информация о происшествии</b>
      <br/>
      <table border="1" style="border:0; margin-top:0">
         <tbody>
            <xsl:if test="gtsh:IncidentDescription">
               <tr>
                  <td style="border:0" width="40%">Описание обстоятельства, препятствующего перевозке товаров</td>
                  <td align="center" style="border-right:0; border-left:0; border-top:0">
                     <xsl:value-of select="gtsh:IncidentDescription"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td style="border:0" width="40%">Дата происшествия</td>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="gtsh:Date"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td style="border:0" width="40%">Место происшествия</td>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:apply-templates select="gtsh:AccidentPlace"/>
               </td>
            </tr>
            <xsl:apply-templates mode="incident" select="gtsh:CustomsPerson"/>
            <xsl:apply-templates select="gtsh:DamageIndicators"/>
            <xsl:if test="gtsh:Measures">
               <tr>
                  <td style="border:0" width="40%">Меры, принятые для продолжения перевозки</td>
                  <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
                     <xsl:value-of select="gtsh:Measures"/>
                  </td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
      <br/>
      <xsl:if test="gtsh:LostGoodsInfo">
         <b>Информация об утрате (отсутствии/уничтожении) части товара: </b>
         <table border="1" cellpadding="0" cellspacing="0" style="margin-top: 0">
            <tbody>
               <tr>
                  <td>№ п/п по ТД/МДП</td>
                  <xsl:if test="//gtsh:GoodsDescription">
                     <td>Наименование товара</td>
                  </xsl:if>
                  <xsl:if test="//gtsh:PackageKindSequence">
                     <td>№ п/п вида упаковки</td>
                  </xsl:if>
                  <xsl:if test="//gtsh:AbsenceKind">
                     <td>Вид утраты товара или его части</td>
                  </xsl:if>
                  <xsl:if test="//gtsh:GrossMass">
                     <td>Вес брутто утраченной части товара</td>
                  </xsl:if>
                  <xsl:if test="//gtsh:LostPackages">
                     <td>Сведения об упаковках</td>
                  </xsl:if>
                  <xsl:if test="//gtsh:LostGoodsQuantity">
                     <td>Количество </td>
                  </xsl:if>
               </tr>
               <xsl:apply-templates select="gtsh:LostGoodsInfo"/>
            </tbody>
         </table>
      </xsl:if>
   </xsl:template>
   <xsl:template match="gtsh:CustomsPerson" mode="incident">
      <tr>
         <td style="border:0" width="40%">Должностное лицо ТО, составившее акт об аварии</td>
         <td align="center" style="border-right:0; border-left:0; border-top:0">
            <xsl:value-of select="cat_ru:PersonName"/>
            <xsl:if test="cat_ru:LNP">(ЛНП: <xsl:value-of select="cat_ru:LNP"/>)</xsl:if>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="gtsh:DamageIndicators">
      <tr>
         <td style="border:0" width="40%">Признаки наличия повреждений</td>
         <td align="center" style="border-right:0; border-left:0; border-top:0;">
            <xsl:choose>
               <xsl:when test="gtsh:IsCargoApartmentDamaged = '1' or gtsh:IsCargoApartmentDamaged='t' or gtsh:IsCargoApartmentDamaged='true'">
					Повреждено грузовое отделение
				</xsl:when>
               <xsl:otherwise>
					Грузовое отделение не повреждено
				</xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="gtsh:IsSealsDamaged = '1' or gtsh:IsSealsDamaged='t' or gtsh:IsSealsDamaged='true'">
					Пломбы повреждены
				</xsl:when>
               <xsl:otherwise>
					Пломбы не повреждены
				</xsl:otherwise>
            </xsl:choose>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="gtsh:LostGoodsInfo">
      <tr>
         <td>
            <xsl:value-of select="gtsh:GoodsNumber"/>
         </td>
         <xsl:if test="//gtsh:GoodsDescription">
            <td>
               <xsl:for-each select="gtsh:GoodsDescription">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
         </xsl:if>
         <xsl:if test="//gtsh:PackageKindSequence">
            <td>
               <xsl:value-of select="gtsh:PackageKindSequence"/>
            </td>
         </xsl:if>
         <xsl:if test="//gtsh:AbsenceKind">
            <td>
               <xsl:choose>
                  <xsl:when test="gtsh:AbsenceKind = '1'">Утерян</xsl:when>
                  <xsl:when test="gtsh:AbsenceKind = '2'">Уничтожен</xsl:when>
                  <xsl:when test="gtsh:AbsenceKind = '3'"> Частично утерян, частично уничтожен</xsl:when>
               </xsl:choose>
            </td>
         </xsl:if>
         <xsl:if test="//gtsh:GrossMass">
            <td>
               <xsl:value-of select="gtsh:GrossMass"/>
            </td>
         </xsl:if>
         <xsl:if test="//gtsh:LostPackages">
            <td>
               <xsl:for-each select="gtsh:LostPackages">
					код <xsl:value-of select="catESAD_cu:PackingCode"/>; 
					<xsl:if test="catESAD_cu:PakingQuantity">
						(кол-во <xsl:value-of select="catESAD_cu:PakingQuantity"/>); 
					</xsl:if>
                  <br/>
               </xsl:for-each>
            </td>
         </xsl:if>
         <xsl:if test="//gtsh:LostGoodsQuantity">
            <td>
               <xsl:for-each select="gtsh:LostGoodsQuantity">
                  <xsl:value-of select="cat_ru:GoodsQuantity"/>
                  <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                  <xsl:if test="cat_ru:MeasureUnitQualifierCode">
						(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
					</xsl:if>
               </xsl:for-each>
            </td>
         </xsl:if>
      </tr>
   </xsl:template>
   <xsl:template match="*" mode="commaSeparated">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>      
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
</xsl:stylesheet>
