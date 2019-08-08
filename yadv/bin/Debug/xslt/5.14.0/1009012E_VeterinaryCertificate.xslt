<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru verc" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:verc="urn:customs.ru:Information:SertifDocuments:VeterinaryCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <!--ПРИКАЗ МИНИСТЕРСТВА СЕЛЬСКОГО ХОЗЯЙСТВА РОССИЙСКОЙ ФЕДЕРАЦИИ №422 от 16 ноября 2006 г; Решение КТС №317-->
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
      <xsl:choose>
         <xsl:when test="$month=1">января</xsl:when>
         <xsl:when test="$month=2">февраля</xsl:when>
         <xsl:when test="$month=3">марта</xsl:when>
         <xsl:when test="$month=4">апреля</xsl:when>
         <xsl:when test="$month=5">мая</xsl:when>
         <xsl:when test="$month=6">июня</xsl:when>
         <xsl:when test="$month=7">июля</xsl:when>
         <xsl:when test="$month=8">августа</xsl:when>
         <xsl:when test="$month=9">сентября</xsl:when>
         <xsl:when test="$month=10">октября</xsl:when>
         <xsl:when test="$month=11">ноября</xsl:when>
         <xsl:when test="$month=12">декабря</xsl:when>
      </xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
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
   <xsl:template name="Date_2">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Time">
      <xsl:value-of select="substring (., 1, 5)"/>.
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
   <xsl:template name="SpecialMark">
      <tr>
         <td>ОСОБЫЕ ОТМЕТКИ: 
	<xsl:for-each select="verc:SpecialNotes">
               <xsl:value-of select="."/> 
	</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td/>
      </tr>
      <tr>
         <td>Соответствуют Единым ветеринарным требованиям.</td>
      </tr>
      <tr>
         <td>Транспортное средство очищено и продезинфицировано.</td>
      </tr>
      <tr>
         <td>Сертификат   предъявляется  для  контроля  при  погрузке, в пути следования и передается грузополучателю.</td>
      </tr>
      <tr>
         <td>Копии сертификата недействительны.</td>
      </tr>
      <tr>
         <td rowspan="">М.П.</td>
         <td>Ветеринарный сертификат выдал</td>
      </tr>
      <tr>
         <td>______________________ 
	<xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
         </td>
      </tr>
      <tr>
         <td> (подпись и полное наименование должности)</td>
      </tr>
      <tr>
         <td>
            <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
         </td>
      </tr>
      <tr>
         <td> (фамилия, инициалы)</td>
      </tr>
   </xsl:template>
   <xsl:template name="Inspection">
      <table class="items" style="width:170mm">
         <tr>
            <td align="center" class="graph10" colspan="8">
               <br>Отметки о ветеринарно-санитарном осмотре при погрузке,</br>
               <br>в пути следования и на месте назначения</br>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph10" rowspan="2">Дата и наименование пунтка, где проводился ветеринарный осмотр (изъятие) (П - погрузка, Т - транзит, В - выгрузка)</td>
            <td align="center" class="graph10" colspan="2">Осмотрено продуктов, сырья </td>
            <td align="center" class="graph10" colspan="2">Кол-во изъятых продуктов, сырья, в т.ч. из-за недоброкачественности, порчи и др.</td>
            <td align="center" class="graph10" colspan="2">Кол-во продуктов, сырья, разрешенных к дальнейшему следованию</td>
            <td align="center" class="graph10" rowspan="2">Подпись должностного лица, производившего осмотр, и печать</td>
         </tr>
         <tr>
            <td align="center" class="graph10">мест (штук)</td>
            <td align="center" class="graph10">вес</td>
            <td align="center" class="graph10">мест (штук)</td>
            <td align="center" class="graph10">вес</td>
            <td align="center" class="graph10">мест (штук)</td>
            <td align="center" class="graph10">вес</td>
         </tr>
         <tr>
            <td align="center" class="graph10">1</td>
            <td align="center" class="graph10">2</td>
            <td align="center" class="graph10">3</td>
            <td align="center" class="graph10">4</td>
            <td align="center" class="graph10">5</td>
            <td align="center" class="graph10">6</td>
            <td align="center" class="graph10">7</td>
            <td align="center" class="graph10">8</td>
         </tr>
         <xsl:for-each select="verc:MarkInspection">
            <tr>
               <td class="graph10">
                  <xsl:for-each select="verc:DateInspection">
                     <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                  <xsl:value-of select="verc:NamePlace"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:ViewedProducts/verc:Quantity"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:ViewedProducts/verc:Weight"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:QuantitySeized/verc:Quantity"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:QuantitySeized/verc:Weight"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:QuantityPermitted/verc:Quantity"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:QuantityPermitted/verc:Weight"/>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:PersonSignatureInspection/cat_ru:PersonPost"/> 
	<xsl:value-of select="verc:PersonSignatureInspection/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="verc:PersonSignatureInspection/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="verc:PersonSignatureInspection/cat_ru:PersonMiddleName"/> 
	<xsl:for-each select="verc:PersonSignatureInspection/cat_ru:IssueDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template name="IssuedRecieved">
      <table style="width:170mm">
         <tr>
            <td>Ветеринарный сертификат получил</td>
            <td>Ветеринарный сертификат выдал</td>
         </tr>
         <tr>
            <td/>
            <td>______________________ 
	<xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
            </td>
         </tr>
         <tr>
            <td>(подпись и полное наименование должности)</td>
            <td>(подпись и полное наименование должности)</td>
         </tr>
         <tr>
            <td/>
            <td>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
            </td>
         </tr>
         <tr>
            <td>(фамилия, инициалы)</td>
            <td>(фамилия, инициалы)</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Form">
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">
            <p>РОССИЙСКАЯ ФЕДЕРАЦИЯ</p>
            <p> ФЕДЕРАЛЬНАЯ СЛУЖБА ПО ВЕТЕРИНАРНОМУ</p>
            <p>И ФИТОСАНИТАРНОМУ НАДЗОРУ</p>
            <p>(РОССЕЛЬХОЗНАДЗОР)</p>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">ВЕТЕРИНАРНЫЙ СЕРТИФИКАТ</td>
      </tr>
      <tr>
         <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Form2">
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">
            <p>РОССИЙСКАЯ ФЕДЕРАЦИЯ</p>
            <p> ФЕДЕРАЛЬНАЯ СЛУЖБА ПО ВЕТЕРИНАРНОМУ</p>
            <p>И ФИТОСАНИТАРНОМУ НАДЗОРУ</p>
            <p>(РОССЕЛЬХОЗНАДЗОР)</p>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph10">
            <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph8">(наименование территориального органа Россельхознадзора)</td>
      </tr>
      <tr>
         <td align="right" class="graph10">от 
				<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
               <xsl:call-template name="Date"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">ВЕТЕРИНАРНЫЙ СЕРТИФИКАТ</td>
      </tr>
      <tr>
         <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящий ветеринарный   сертификат 
			<xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
               <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
      </tr>
   </xsl:template>
   <xsl:template name="Form2a">
      <tr>
         <td align="right" class="graph10">Форма N 
		<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">
            <p>РОССИЙСКАЯ ФЕДЕРАЦИЯ</p>
            <p> ФЕДЕРАЛЬНАЯ СЛУЖБА ПО ВЕТЕРИНАРНОМУ</p>
            <p>И ФИТОСАНИТАРНОМУ НАДЗОРУ</p>
            <p>(РОССЕЛЬХОЗНАДЗОР)</p>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph10">
            <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph8">(наименование территориального органа Россельхознадзора)</td>
      </tr>
      <tr>
         <td align="right" class="graph10">от 
				<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
               <xsl:call-template name="Date"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph12">КОРЕШОК ВЕТЕРИНАРНОГО СЕРТИФИКАТА</td>
      </tr>
      <tr>
         <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
         </td>
      </tr>
      <tr>
         <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящий ветеринарный   сертификат 
			<xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
               <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
      </tr>
   </xsl:template>
   <xsl:template name="Form02">
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm"><!--ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА-->
               ТАМОЖЕННЫЙ СОЮЗ
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <!--<br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)-->
			</td>
               <!--td/-->
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12"><b>ВЕТЕРИНАРНЫЙ СЕРТИФИКАТ</b><br/><br/></td>
            </tr>
            <tr>
               <td align="left" class="graph12">Серия 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
					<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10 underlined">Я, нижеподписавшийся,   выдал  настоящий ветеринарный сертификат
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10 underlined">в том, что 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование продукции)</td>
            </tr>
            <tr>
               <td class="graph10 underlined">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      <xsl:value-of select="verc:ProductPacking"/><xsl:text>     </xsl:text><xsl:value-of select="verc:ProductMark"/>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(мест, штук, кг)    (упаковка)    (маркировка)</td>
            </tr>
            <tr>
               <td class="graph10 underlined">выработанная 
				<xsl:if test="verc:Manufacturer/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/>
                  </xsl:if> 
				<xsl:if test="verc:Manufacturer/verc:OwnersManufacturer">
                     <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> </xsl:if>
                  <xsl:for-each select="verc:Manufacturer/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование предприятия, ф.и.о. владельца, адрес)</td>
            </tr>
            <tr>
               <td class="graph10 underlined" align="center">
                  <xsl:if test="verc:DateManufactur">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateManufactur"/>
                     </xsl:call-template>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(дата выработки)</td>
            </tr>
            <tr>
               <td align="left" class="graph10">
                  <xsl:choose>
                     <xsl:when test="verc:Examination='0'">подвергнута ветеринарно-санитарной экспертизе в полном объеме</xsl:when>
                     <xsl:when test="verc:Examination='1'">изготовлена из сырья, прошедшего ветеринарно-санитарную экспертизу</xsl:when>
                  </xsl:choose>				
				и признана годной для:<u>
				<xsl:choose>
                     <xsl:when test="verc:DeemedFit=1">реализации без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=2">реализации с ограничением<xsl:if test="verc:CauseRestrictions"> - <xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                     <xsl:when test="verc:DeemedFit=3">переработки</xsl:when>
                     <xsl:when test="verc:DeemedFit=4">использование без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=5">использование с ограничением<xsl:if test="verc:CauseRestrictions"> - <xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                  </xsl:choose></u>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10 underlined">выходит из 
				<xsl:if test="verc:Location/verc:Address">
                     <xsl:for-each select="verc:Location/verc:Address">
                        <xsl:call-template name="Address"/>   </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="verc:Location/verc:PlaceLocation">
                     <xsl:value-of select="verc:Location/verc:PlaceLocation"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(адрес и местонахождение продукции)</td>
            </tr>
            <tr>
               <td align="left" class="graph10 underlined">и направляется
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if>
                  <!--условия перевозки? -->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта, маршрут следования, условия перевозки)</td>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td class="graph10" style="width:10mm" valign="top">в</td>
                        <td class="graph10 underlined" style="width:75mm" valign="top">
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:if test="verc:Receiver/cat_ru:Address">
                              <xsl:for-each select="verc:Receiver/cat_ru:Address">
                                 <xsl:call-template name="Address"/>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                        <td class="graph10" style="width:10mm" valign="top">по</td>
                        <td class="graph10 underlined" style="width:75mm" valign="top">
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/> </xsl:if>
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/> </xsl:if>
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentDate"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8" colspan="2">(наименование и адрес получателя)</td>
                        <td align="center" class="graph8" colspan="2">(наименование, № и дата выдачи <br/>товаространспортного документа)</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph10 underlined">Продукция подвергнута дополнительным лабораторным исследованиям  
							<xsl:for-each select="verc:ResearchLaboratory">
                              <xsl:value-of select="verc:NameLaboratory"/> 
				<xsl:if test="verc:NumberExamination">
                                 <xsl:value-of select="verc:NumberExamination"/> </xsl:if>
                              <xsl:value-of select="verc:ResultExamination"/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(наименование лаборатории, N экспертизы и результаты исследования)</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td class="graph10 underlined">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                              <xsl:value-of select="."/> 
				<xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)
							</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph10">Соответствует Единым ветеринарным требованиям.<br/>Транспортное средство очищено и продезинфицировано.<br/>Сертификат предъявляется для контроля и передается грузополучателю. <br/><br/><br/><br/>
				</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom"/>
               <td align="center" style="width:100mm"> Ветеринарный сертификат выдал</td>
            </tr>
            <tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom"/>
               <td align="right" style="width:100mm" class="underlined">
               <xsl:text></xsl:text>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                </td>
            </tr>
            <tr class="graph8">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom"/>
               <td align="center" style="width:100mm">
                  (подпись и полное наименование должности)
				</td>
			</tr>
			<tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom">МП</td>
               <td align="center" style="width:100mm" class="underlined">
				<xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.
				</td>
			</tr>
			<tr class="graph8">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom"/>
               <td align="center" style="width:100mm">
               	(фамилия и инициалы)
               	</td>
            </tr>
         </tbody>
      </table>
      <!--xsl:call-template name="Inspection"/-->
      <!--br/>
      <br/>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
               </td>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">КОРЕШОК ВЕТЕРИНАРНОГО СВИДЕТЕЛЬСТВА</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящее ветеринарное   свидетельство 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование продукции)</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      <xsl:if test="verc:ProductMark">
                        <xsl:value-of select="verc:ProductMark"/>
                     </xsl:if>     <xsl:if test="verc:ProductPacking">
                        <xsl:value-of select="verc:ProductPacking"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(мест, штук, кг)    (упаковка)    (маркировка)</td>
            </tr>
            <tr>
               <td class="graph10">выработанная 
				<xsl:if test="verc:Manufacturer/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Manufacturer/verc:OwnersManufacturer">
                     <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> </xsl:if>
                  <xsl:for-each select="verc:Manufacturer/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование предприятия, ф.и.о. владельца, адрес)</td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:if test="verc:DateManufactur">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateManufactur"/>
                     </xsl:call-template>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(дата выработки)</td>
            </tr>
            <tr>
               <td align="left" class="graph8">
                  <xsl:choose>
                     <xsl:when test="verc:Examination=0 or verc:Examination='f' or verc:Examination='false'">подвергнута ветеринарно-санитарной экспертизе в полном объеме</xsl:when>
                     <xsl:when test="verc:Examination=1 or verc:Examination='t' or verc:Examination='true'">зготовлена из сырья, прошедшего ветеринарно-санитарную экспертизу</xsl:when>
                  </xsl:choose>				
				и признана годной для:
				<xsl:choose>
                     <xsl:when test="verc:DeemedFit=1">реализации без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=2">реализации с ограничением<xsl:if test="verc:CauseRestrictions"> - 
					<xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                     <xsl:when test="verc:DeemedFit=3">переработки</xsl:when>
                     <xsl:when test="verc:DeemedFit=4">использование без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=5">использование с ограничением<xsl:if test="verc:CauseRestrictions">  - 
					<xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph8">выходит из 
				<xsl:if test="verc:Location/verc:Address">
                     <xsl:for-each select="verc:Location/verc:Address">
                        <xsl:call-template name="Address"/>   </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="verc:Location/verc:PlaceLocation">
                     <xsl:value-of select="verc:Location/verc:PlaceLocation"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(адрес и местонахождение продукции)</td>
            </tr>
            <tr>
               <td align="left" class="graph8">и направляется
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if-->
                  <!--условия перевозки? -->
               <!--/td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта, маршрут следования, условия перевозки)</td>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td class="graph8" style="width:10mm" valign="top">в</td>
                        <td class="graph8" style="width:75mm" valign="top">
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:if test="verc:Receiver/cat_ru:Address">
                              <xsl:for-each select="verc:Receiver/cat_ru:Address">
                                 <xsl:call-template name="Address"/>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                        <td class="graph8" style="width:10mm" valign="top">по</td>
                        <td class="graph8" style="width:75mm" valign="top">
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/> </xsl:if>
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/> </xsl:if>
                           <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                              <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentDate"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8" colspan="2">(наименование и адрес получателя)</td>
                        <td align="center" class="graph8" colspan="2">(наименование, № и дата выдачи <br/>товаространспортного документа)</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph8">Продукция подвергнута дополнительным лабораторным исследованиям  
							<xsl:for-each select="verc:ResearchLaboratory">
                              <xsl:value-of select="verc:NameLaboratory"/> 
							<xsl:if test="verc:NumberExamination">
                                 <xsl:value-of select="verc:NumberExamination"/> </xsl:if>
                              <xsl:value-of select="verc:ResultExamination"/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(наименование лаборатории, N экспертизы и результаты исследования)</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)
							</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
            <tr>
               <table style="width:170mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph10">Транспортное средство очищено и продезинфицировано.<br/>Свидетельство предъявляется для контроля при погрузке, в пути следования и передается грузополучателю. <br/>Копии свидетельства не действительны
				</td>
                     </tr>
                  </tbody>
               </table>
            </tr>
         </tbody>
      </table>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство получил<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/-->
                  <!--<xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>-->
                  <!--<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>-->
                  <!--br/>(фамилия и инициалы)</td>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство выдал<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> 
				<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия и инициалы)</td>
            </tr>
         </tbody>
      </table-->
   </xsl:template>
   <xsl:template name="Form03">
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">ВЕТЕРИНАРНОЕ СВИДЕТЕЛЬСТВО</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящее ветеринарное   свидетельство 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что 
                  <!--<xsl:value-of select="verc:ProductInfo/verc:ProductName"/>-->
                  <xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование технического сырья или кормов)</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      
				 <xsl:if test="verc:ProductMark">
                        <xsl:value-of select="verc:ProductMark"/>
                     </xsl:if>     
				 <xsl:if test="verc:ProductPacking">
                        <xsl:value-of select="verc:ProductPacking"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(мест, штук, кг)    (упаковка)    (маркировка)</td>
            </tr>
            <tr>
               <td class="graph10">происхождение
                  <!--<xsl:value-of select=""/>-->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(боенское, палое, сборное, полученное<br/>от здоровых или больных животных

)</td>
            </tr>
            <tr>
               <td class="graph10">выработанная (заготовлено) под контролем госветслужбы
				<xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/> <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> 
				<xsl:for-each select="verc:Manufacturer/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование предприятия, ф.и.о. владельца, адрес)</td>
            </tr>
            <tr>
               <td class="graph10">и признано годным для
				<xsl:choose>
                     <xsl:when test="verc:DeemedFit=1">реализации</xsl:when>
                     <xsl:when test="verc:DeemedFit=2">реализации с ограничением<xsl:if test="verc:ProductInfo/verc:CauseRestrictions"> - <xsl:value-of select="verc:ProductInfo/verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                     <xsl:when test="verc:DeemedFit=3">переработки</xsl:when>
                     <xsl:when test="verc:DeemedFit=4">использования без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=5">использования с ограничением<xsl:if test="verc:ProductInfo/verc:CauseRestrictions"> - <xsl:value-of select="verc:ProductInfo/verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">выходит из 
				<xsl:if test="verc:Location/verc:Address">
                     <xsl:for-each select="verc:Location/verc:Address">
                        <xsl:call-template name="Address"/>   </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="verc:Location/verc:PlaceLocation">
                     <xsl:value-of select="verc:Location/verc:PlaceLocation"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(адрес и местонахождение продукции)</td>
            </tr>
            <tr>
               <td align="left" class="graph10">и направляется
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if>
                  <!--условия перевозки? -->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта, маршрут следования, условия перевозки)</td>
            </tr>
            <tr>
               <td class="graph10" valign="top">в
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Receiver/cat_ru:Address">
                     <xsl:for-each select="verc:Receiver/cat_ru:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование и адрес получателя)</td>
            </tr>
            <tr>
               <td class="graph8" valign="top">по
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/> </xsl:if>
                  <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/> </xsl:if>
                  <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:ShippingDocuments/cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование, № и дата выдачи <br/>товаространспортного документа)</td>
            </tr>
            <tr>
               <tr>
                  <td align="left" class="graph10">Сырье (корма) подвергнуты 
							<xsl:for-each select="verc:ResearchLaboratory">
                        <xsl:if test="verc:MethodExamination">
                           <xsl:value-of select="verc:MethodExamination"/>, </xsl:if>
                        <xsl:value-of select="verc:NameLaboratory"/>, 
				<xsl:if test="verc:NumberExamination">
                           <xsl:value-of select="verc:NumberExamination"/>, 
				</xsl:if>
                        <xsl:if test="verc:DateExamination">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="verc:DateExamination"/>
                           </xsl:call-template>, 
				</xsl:if>
                        <xsl:value-of select="verc:ResultExamination"/>
                        <xsl:if test="position()!=last()">; </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8">(указать метод и наименование препаратов, <br/>
наименование лаборатории, N, дату выдачи экспертизы и результаты исследования)</td>
               </tr>
            </tr>
            <tr>
               <tr>
                  <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                        <xsl:value-of select="."/> 
				<xsl:if test="position()!=last()"> </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)
							</td>
               </tr>
            </tr>
            <tr>
               <tr>
                  <td align="left" class="graph10">Транспортное средство очищено и продезинфицировано.<br/>Свидетельство предъявляется для контроля при погрузке, в пути следования и передается грузополучателю. <br/>Копии свидетельства не действительны
				</td>
               </tr>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="bottom">М.П.</td>
               <td align="center" style="width:100mm">  Ветеринарное свидетельство выдал
				<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				
				
				
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия и инициалы)
				</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <xsl:call-template name="Inspection"/>
      <br/>
      <br/>
      <br/>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
               </td>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">КОРЕШОК ВЕТЕРИНАРНОГО СВИДЕТЕЛЬСТВА</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящее ветеринарное   свидетельство 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что 
                  <!--<xsl:value-of select="verc:ProductInfo/verc:ProductName"/>-->
                  <xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование технического сырья или кормов)</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      
				 <xsl:if test="verc:ProductMark">
                        <xsl:value-of select="verc:ProductMark"/>     </xsl:if>
                     <xsl:if test="verc:ProductPacking">
                        <xsl:value-of select="verc:ProductPacking"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(мест, штук, кг)    (упаковка)    (маркировка)</td>
            </tr>
            <tr>
               <td class="graph10">происхождение
                  <!--<xsl:value-of select=""/>-->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(боенское, палое, сборное, полученное<br/>от здоровых или больных животных

)</td>
            </tr>
            <tr>
               <td class="graph10">выработанная (заготовлено) под контролем госветслужбы
				<xsl:if test="verc:Manufacturer/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Manufacturer/verc:OwnersManufacturer">
                     <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> </xsl:if>
                  <xsl:for-each select="verc:Manufacturer/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование предприятия, ф.и.о. владельца, адрес)</td>
            </tr>
            <tr>
               <td class="graph10">и признано годным для
				<xsl:choose>
                     <xsl:when test="verc:DeemedFit=1">реализации</xsl:when>
                     <xsl:when test="verc:DeemedFit=2">реализации с ограничением<xsl:if test="verc:CauseRestrictions"> - <xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                     <xsl:when test="verc:DeemedFit=3">переработки</xsl:when>
                     <xsl:when test="verc:DeemedFit=4">использования без ограничений</xsl:when>
                     <xsl:when test="verc:DeemedFit=5">использования с ограничением<xsl:if test="verc:CauseRestrictions"> - <xsl:value-of select="verc:CauseRestrictions"/>
                        </xsl:if>
                     </xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">выходит из 
				<xsl:if test="verc:Location/verc:Address">
                     <xsl:for-each select="verc:Location/verc:Address">
                        <xsl:call-template name="Address"/>   </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="verc:Location/verc:PlaceLocation">
                     <xsl:value-of select="verc:Location/verc:PlaceLocation"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(адрес и местонахождение продукции)</td>
            </tr>
            <tr>
               <td align="left" class="graph10">и направляется
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if>
                  <!--условия перевозки? -->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта, маршрут следования, условия перевозки)</td>
            </tr>
            <tr>
               <td class="graph10" valign="top">в
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Receiver/cat_ru:Address">
                     <xsl:for-each select="verc:Receiver/cat_ru:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование и адрес получателя)</td>
            </tr>
            <tr>
               <td class="graph8" valign="top">по
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/> </xsl:if>
                  <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/> </xsl:if>
                  <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:ShippingDocuments/cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование, № и дата выдачи <br/>товаространспортного документа)</td>
            </tr>
            <tr>
               <tr>
                  <td align="left" class="graph10">Сырье (корма) подвергнуты 
							<xsl:for-each select="verc:ResearchLaboratory">
                        <xsl:if test="verc:MethodExamination">
                           <xsl:value-of select="verc:MethodExamination"/>, </xsl:if>
                        <xsl:value-of select="verc:NameLaboratory"/>, 
				<xsl:if test="verc:NumberExamination">
                           <xsl:value-of select="verc:NumberExamination"/>, 
				</xsl:if>
                        <xsl:if test="verc:DateExamination">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="verc:DateExamination"/>
                           </xsl:call-template>, 
				</xsl:if>
                        <xsl:value-of select="verc:ResultExamination"/>
                        <xsl:if test="position()!=last()"> </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8">(указать метод и наименование препаратов, <br/>
наименование лаборатории, N, дату выдачи экспертизы и результаты исследования)</td>
               </tr>
            </tr>
            <tr>
               <tr>
                  <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                        <xsl:value-of select="."/> 
				<xsl:if test="position()!=last()"> </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)
							</td>
               </tr>
            </tr>
            <tr>
               <tr>
                  <td align="left" class="graph10">Транспортное средство очищено и продезинфицировано.<br/>Свидетельство предъявляется для контроля при погрузке, в пути следования и передается грузополучателю. <br/>Копии свидетельства не действительны
				</td>
               </tr>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство получил<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <!--<xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>-->
                  <!--<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>-->
                  <br/>(фамилия и инициалы)</td>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство выдал<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия и инициалы)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="Form04">
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">ВЕТЕРИНАРНАЯ СПРАВКА</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящую ветеринарную справку 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что принадлежая ему 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование продукции; вид, возраст, пол животных, птиц, (рыб))</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      
				 <xsl:if test="verc:ProductMark">
                        <xsl:value-of select="verc:ProductMark"/>     </xsl:if>
                     <xsl:if test="verc:ProductPacking">
                        <xsl:value-of select="verc:ProductPacking"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кг, мест, штук, голов)    (упаковка)    (маркировка, номер и форма клейма)</td>
            </tr>
            <tr>
               <td class="graph10">подвергнута(ы)
				</td>
            </tr>
            <tr>
               <td align="center" class="graph8">(исследованиям, вакцинации, обработкам,<br/> дезинфекции, консервации, пастеризации (стерилизации), <br/>ветэкспертизе и др.)

)</td>
            </tr>
            <tr>
               <td class="graph10">направляе(ю)тся <xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта) (маршрут следования)</td>
            </tr>
            <tr>
               <td class="graph10" valign="top">в
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Receiver/cat_ru:Address">
                     <xsl:for-each select="verc:Receiver/cat_ru:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">для <xsl:if test="verc:ReasonSending">
                     <xsl:value-of select="verc:ReasonSending"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указываются: номера ветеринарных клейм, номера и клички животных

)
							</td>
            </tr>
            <tr>
               <td>-------------------------------------------------------------------------------------------------------------------------------</td>
            </tr>
            <tr>
               <td align="center" class="graph8">(заполняется при отправке на особых условиях)</td>
            </tr>
            <tr>
               <td>_______________________________________________________________________</td>
            </tr>
            <tr>
               <td align="left" class="graph10">Ветеринарная справка действительна  только в оригинале и на
<br/>территории  района (города) в течение 3-х дней с момента выдачи
<br/>и до начала транспортировки, реализации, хранения.</td>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="top">М.П.</td>
               <td align="center" style="width:100mm">  Ветеринарную справку выдал
				<br/>(подпись)<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия, инициалы)
				</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">КОРЕШОК ВЕТЕРИНАРНОЙ СПРАВКИ</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящую ветеринарную справку 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что принадлежая ему 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">	(наименование продукции; вид, возраст, пол животных, птиц, (рыб))</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                     <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
				      
				 <xsl:if test="verc:ProductMark">
                        <xsl:value-of select="verc:ProductMark"/>     </xsl:if>
                     <xsl:if test="verc:ProductPacking">
                        <xsl:value-of select="verc:ProductPacking"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кг, мест, штук, голов)    (упаковка)    (маркировка, номер и форма клейма)</td>
            </tr>
            <tr>
               <td class="graph10">подвергнута(ы)
				</td>
            </tr>
            <tr>
               <td align="center" class="graph8">(исследованиям, вакцинации, обработкам,<br/> дезинфекции, консервации, пастеризации (стерилизации), <br/>ветэкспертизе и др.)

)</td>
            </tr>
            <tr>
               <td class="graph10">направляе(ю)тся <xsl:for-each select="verc:TransportInfo">
                     <xsl:if test="verc:TransportModeCode">
                        <xsl:value-of select="verc:TransportModeCode"/>
                     </xsl:if>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="verc:Route">, <xsl:value-of select="verc:Route"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(вид транспорта) (маршрут следования)</td>
            </tr>
            <tr>
               <td class="graph10" valign="top">в
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                  <xsl:if test="verc:Receiver/cat_ru:Address">
                     <xsl:for-each select="verc:Receiver/cat_ru:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">для <xsl:if test="verc:ReasonSending">
                     <xsl:value-of select="verc:ReasonSending"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указываются: номера ветеринарных клейм, номера и клички животных

)
							</td>
            </tr>
            <tr>
               <td>-------------------------------------------------------------------------------------------------------------------------------</td>
            </tr>
            <tr>
               <td align="center" class="graph8">(заполняется при отправке на особых условиях)</td>
            </tr>
            <tr>
               <td>_______________________________________________________________________</td>
            </tr>
            <tr>
               <td align="left" class="graph10">Ветеринарная справка действительна  только в оригинале и на
<br/>территории  района (города) в течение 3-х дней с момента выдачи
<br/>и до начала транспортировки, реализации, хранения.</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph8" style="width:90mm">Ветеринарную справку получил<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <br/>(подпись, наименование должности или серия и № паспорта)
				<br/>
                  <!--<xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>-->
                  <!--<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>-->фамилия, инициалы)</td>
               <td align="center" class="graph8" style="width:90mm">Ветеринарную справку выдал<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия, инициалы)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="Form1">
      <xsl:variable name="LocationTime" select="verc:LocationCU"/>
      <tr>
         <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
         </td>
      </tr>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">ВЕТЕРИНАРНОЕ СВИДЕТЕЛЬСТВО</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящее ветеринарное   свидетельство 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что при ветеринарном осмотре подлежащих отправке 
				<br/>
                  <xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/>
                     <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать вид животных, биологических объектов)</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/>
				  голов (мест, штук)
				 <xsl:if test="position()!=last()">, </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">больных   и   подозрительных по заболеванию заразными болезнями не обнаружено и они выходят (вывозятся) из <br/>
                  <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <xsl:for-each select="verc:Sender/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать наименование организации-отправителя, полный адрес, в т.ч. название населенного пункта, улицы и номера дома, района, области, края, автономного образования или республики в составе Российской Федерации)</td>
            </tr>
            <tr>
               <td class="graph10">благополучного по особо опасным и карантинным болезням животных. При отправке на экспорт указывают  благополучие хозяйства и местности согласно требованиям страны-импортера и срок их благополучия (мес., лет) 
				<xsl:for-each select="verc:WellBeingInfo/verc:DescriptionWellBeing">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
                  <xsl:if test="verc:WellBeingInfo/verc:TermWellBeing">
                     <xsl:value-of select="verc:WellBeingInfo/verc:TermWellBeing"/> </xsl:if>
                  <xsl:if test="verc:WellBeingInfo/verc:UnitTermWellBeing">
                     <xsl:value-of select="verc:WellBeingInfo/verc:UnitTermWellBeing"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <!--<xsl:variable name="LocationTime" select="verc:ProductInfo/verc:LocationCU"/>-->
               <td class="graph10">Животные находились в Российской Федерации:  
				<xsl:choose>
                     <xsl:when test="$LocationTime=1">
					с рождения
					</xsl:when>
                     <xsl:when test="$LocationTime=2">
					не менее 6 месяцев
					</xsl:when>
                     <xsl:when test="$LocationTime=3">
                        <xsl:if test="verc:TimeLocation">
                           <xsl:value-of select="verc:TimeLocation"/>
                        </xsl:if>
					 месяцев.
					</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td class="graph10">Животные перед отправкой карантинировались 
				<xsl:value-of select="verc:Quarantine/verc:PlaseQuarantine"/> 
				<xsl:value-of select="verc:Quarantine/verc:NumberDays"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(место карантинирования и количество дней)</td>
            </tr>
            <tr>
               <td class="graph10">В   период   карантинирования животные не имели контакта с другими животными; ежедневно   клинически осматривались и у них измеряласьтемпература тела; в день выдачи свидетельства обследованы, больных и подозрительных в заболевании не выявлено.</td>
            </tr>
            <tr>
               <td class="graph10">В   период   карантинирования    материал от животных исследовался в государственной ветеринарной лаборатории 
				<xsl:for-each select="verc:ResearchLaboratory">
                     <xsl:value-of select="verc:NameLaboratory"/> </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать наименование лаборатории)</td>
            </tr>
            <tr>
               <td class="graph10">и были получены следующие результаты:
</td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="LaboratoryResults"/>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="Vacination"/>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="Parasites"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Упаковочный   материал   и    сопровождающие   грузы    происходят непосредственно  из   хозяйства-поставщика  и не   контаминированы возбудителями инфекционных болезней. Животные направляются 
				
				<xsl:for-each select="verc:Receiver/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each> 
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(пункт назначения и получатель)</td>
            </tr>
            <tr>
               <td class="graph10">при спецификации (гуртовой ведомости, накладной) N 
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/>
                  </xsl:if>
				 от 
				<xsl:for-each select="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
				для 
				<xsl:if test="verc:ReasonSending">
                     <xsl:value-of select="verc:ReasonSending"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(откорма, разведения, продажи, убоя и т.д.)</td>
            </tr>
            <tr>
               <td class="graph10">и следуют 
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:value-of select="verc:TransportName"/> 
		<xsl:value-of select="verc:TransportNumber"/>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(железнодорожным, водным, автомобильным, воздушным транспортом; N автомобиля, вагона, название судна, N рейса и т.д.)</td>
            </tr>
            <tr>
               <td class="graph10">по маршруту: 
				<xsl:if test="verc:Route">
                     <xsl:value-of select="verc:Route"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать основные пункты следования)</td>
            </tr>
            <tr>
               <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
            </tr>
            <tr>
               <td align="center" class="graph8">(заполняется при отправке животных, переболевших особо опасными заболеваниями, перевозке на особых условиях и по специальному разрешению (указанию), кем оно дано, номер и дата)</td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:for-each select="verc:MarkInspection">
                     <xsl:value-of select="verc:NamePlace"/> 
				<xsl:for-each select="verc:DateInspection">
                        <xsl:call-template name="Date_2"/> 
				</xsl:for-each>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(отметки об осмотре при погрузке, выгрузке, в пути следования)</td>
            </tr>
            <tr>
               <td align="left" class="graph10">Транспортное средство очищено и продезинфицировано.<br/>Свидетельство предъявляется для контроля при погрузке, в пути следования и передается грузополучателю. <br/>Копии свидетельства не действительны</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr class="graph10">
               <td style="width:35mm"/>
               <td align="right" style="width:35mm" valign="top">М.П.</td>
               <td align="center" style="width:100mm">  Ветеринарное свидетельство выдал
				<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия и инициалы)
				</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="right" class="graph10">Форма N 
			<xsl:value-of select="verc:NumberForm"/>
               </td>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" style="width:100mm">ГОСУДАРСТВЕННАЯ ВЕТЕРИНАРНАЯ СЛУЖБА
				<br/>
                  <u class="graph10">
                     <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                  </u>
                  <br/>
                  <br/>(субъект Российской Федерации )
			<br/>(район (город))
				<br/>
                  <br/>(наименование учреждения)
			</td>
               <td/>
            </tr>
         </tbody>
      </table>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph12">КОРЕШОК ВЕТЕРИНАРНОГО СВИДЕТЕЛЬСТВА</td>
            </tr>
            <tr>
               <td align="center" class="graph12">N 
		<xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph12">от
		<xsl:for-each select="verc:RegistrationInfo/verc:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="left" class="graph10">Я, нижеподписавшийся,   выдал  настоящее ветеринарное   свидетельство 
			<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(кому - наименование юридического лица или ф.и.о. физического лица)</td>
            </tr>
            <tr>
               <td class="graph10">в том, что при ветеринарном осмотре подлежащих отправке 
				<br/>
                  <xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductName"/> </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать вид животных, биологических объектов)</td>
            </tr>
            <tr>
               <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
                     <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/>
                     <xsl:if test="position()!=last()"> </xsl:if>
                  </xsl:for-each>
				  голов (мест, штук)</td>
            </tr>
            <tr>
               <td class="graph10">больных   и   подозрительных по заболеванию заразными болезнями не обнаружено и они выходят (вывозятся) из <br/>
                  <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <xsl:for-each select="verc:Sender/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать наименование организации-отправителя, полный адрес, в т.ч. название населенного пункта, улицы и номера дома, района, области, края, автономного образования или республики в составе Российской Федерации)</td>
            </tr>
            <tr>
               <td class="graph10">благополучного по особо опасным и карантинным болезням животных. При отправке на экспорт указывают  благополучие хозяйства и местности согласно требованиям страны-импортера и срок их благополучия (мес., лет) 
				<xsl:for-each select="verc:WellBeingInfo/verc:DescriptionWellBeing">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
                  <xsl:if test="verc:WellBeingInfo/verc:TermWellBeing">
                     <xsl:value-of select="verc:WellBeingInfo/verc:TermWellBeing"/> </xsl:if>
                  <xsl:if test="verc:WellBeingInfo/verc:UnitTermWellBeing">
                     <xsl:value-of select="verc:WellBeingInfo/verc:UnitTermWellBeing"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <!--<xsl:variable name="LocationTime" select="verc:ProductInfo/verc:LocationCU"/>-->
               <td class="graph10">Животные находились в Российской Федерации:  
				<xsl:choose>
                     <xsl:when test="$LocationTime=1">
					с рождения
					</xsl:when>
                     <xsl:when test="$LocationTime=2">
					не менее 6 месяцев
					</xsl:when>
                     <xsl:when test="$LocationTime=3">
                        <xsl:if test="verc:TimeLocation">
                           <xsl:value-of select="verc:TimeLocation"/>
                        </xsl:if>
					 месяцев.
					</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td class="graph10">Животные перед отправкой карантинировались 
				<xsl:if test="verc:Quarantine">
                     <xsl:value-of select="verc:Quarantine/verc:PlaseQuarantine"/> </xsl:if>
                  <xsl:if test="verc:Quarantine">
                     <xsl:value-of select="verc:Quarantine/verc:NumberDays"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(место карантинирования и количество дней)</td>
            </tr>
            <tr>
               <td class="graph10">В   период   карантинирования животные не имели контакта с другими животными; ежедневно   клинически осматривались и у них измеряласьтемпература тела; в день выдачи свидетельства обследованы, больных и подозрительных в заболевании не выявлено.</td>
            </tr>
            <tr>
               <td class="graph10">В   период   карантинирования    материал от животных исследовался <br/>в государственной ветеринарной лаборатории 
				<xsl:for-each select="verc:ResearchLaboratory">
                     <xsl:value-of select="verc:NameLaboratory"/> </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать наименование лаборатории)</td>
            </tr>
            <tr>
               <td class="graph10">и были получены следующие результаты:
</td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="LaboratoryResults"/>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="Vacination"/>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:call-template name="Parasites"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Упаковочный   материал   и    сопровождающие   грузы    происходят непосредственно  из   хозяйства-поставщика  и не   контаминированы возбудителями инфекционных болезней. Животные направляются 
				
				<xsl:for-each select="verc:Receiver/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each> 
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(пункт назначения и получатель)</td>
            </tr>
            <tr>
               <td class="graph10">при спецификации (гуртовой ведомости, накладной) N 
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
                     <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/>
                  </xsl:if>
				 от 
				<xsl:for-each select="verc:ShippingDocuments/cat_ru:PrDocumentDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
				для 
				<xsl:if test="verc:ReasonSending">
                     <xsl:value-of select="verc:ReasonSending"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(откорма, разведения, продажи, убоя и т.д.)</td>
            </tr>
            <tr>
               <td class="graph10">и следуют 
				<xsl:for-each select="verc:TransportInfo">
                     <xsl:value-of select="verc:TransportName"/> 
		<xsl:value-of select="verc:TransportNumber"/>
                     <xsl:if test="position()!=last()">; </xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(железнодорожным, водным, автомобильным, воздушным транспортом; N автомобиля, вагона, название судна, N рейса и т.д.)</td>
            </tr>
            <tr>
               <td class="graph10">по маршруту: 
				<xsl:if test="verc:Route">
                     <xsl:value-of select="verc:Route"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указать основные пункты следования)</td>
            </tr>
            <tr>
               <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
            </tr>
            <tr>
               <td align="center" class="graph8">(заполняется при отправке животных, переболевших особо опасными заболеваниями, перевозке на особых условиях и по специальному разрешению (указанию), кем оно дано, номер и дата)</td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:for-each select="verc:MarkInspection">
                     <xsl:value-of select="verc:NamePlace"/> 
				<xsl:for-each select="verc:DateInspection"/>
                     <xsl:call-template name="Date_2"/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(отметки об осмотре при погрузке, выгрузке, в пути следования)</td>
            </tr>
            <tr>
               <td align="left" class="graph10">Транспортное средство очищено и продезинфицировано.<br/>Свидетельство предъявляется для контроля при погрузке, в пути следования и передается грузополучателю. <br/>Копии свидетельства не действительны</td>
            </tr>
         </tbody>
      </table>
      <br/>
      <table style="width:170mm">
         <tbody>
            <tr>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство получил<br/>
                  <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                     <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <!--<xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>-->
                  <!--<xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>-->
                  <br/>(фамилия и инициалы)</td>
               <td align="center" class="graph8" style="width:90mm">Ветеринарное свидетельство выдал<br/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                     <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
                  <br/>(подпись и полное наименование должности)
				<br/>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonName,1,1)"/>.
				<xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                     <xsl:value-of select="substring(verc:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
                  <br/>(фамилия и инициалы)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="Department">
      <tr>
         <td class="graph10">Подразделение Россельхознадзора 
		<xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Exporter">
      <tr>
         <td class="graph10">Название и адрес экспортера 
			<xsl:if test="verc:Sender/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:for-each select="verc:Sender/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="ProductDirection">
      <tr>
         <td class="graph10">Страна назначения 
			<xsl:if test="verc:ImportingCountry">
               <xsl:value-of select="verc:ImportingCountry"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph10">Страна транзита 
			<xsl:if test="verc:Route">
               <xsl:value-of select="verc:Route"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph10">Пункт пересечения границы 
			<xsl:if test="verc:Route">
               <xsl:value-of select="verc:Route"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph10"> Название и адрес получателя 
			<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/>
            </xsl:if>
            <xsl:for-each select="verc:Receiver/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10">Транспорт 
			<xsl:for-each select="verc:TransportInfo">
               <xsl:if test="verc:TransportName">
                  <xsl:value-of select="verc:TransportName"/> </xsl:if>
               <xsl:if test="verc:TransportNumber">
                  <xsl:value-of select="verc:TransportNumber"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8"> (указать N вагона, автомашины, рейс самолета, название судна)</td>
      </tr>
   </xsl:template>
   <xsl:template name="ProductInfo">
      <tr>
         <td class="graph10">Наименование продукции 
			<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductName"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10">Число мест 
			<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10">Упаковка 
			<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductPacking"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10">Маркировка 
			<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductMark"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10">Вес нетто 
			<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:Weight"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Animals">
      <table class="items graph10" style="width:165mm">
         <tr>
            <td style="width:35mm">Вид животного*</td>
            <td style="width:15mm">Пол</td>
            <td style="width:30mm">Порода</td>
            <td style="width:15mm">Возраст</td>
            <td style="width:70mm">Ушная метка, клеймо, кличка, вес</td>
         </tr>
         <xsl:for-each select="verc:ProductInfo">
            <tr>
               <td>
                  <xsl:value-of select="verc:ProductName"/>
               </td>
               <td>
                  <xsl:if test="verc:Sex">
                     <xsl:value-of select="verc:Sex"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="verc:Breed">
                     <xsl:value-of select="verc:Breed"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="verc:Age">
                     <xsl:value-of select="verc:Age"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="verc:Brand">
                     <xsl:value-of select="verc:Brand"/>
                     <br/>
                  </xsl:if>
                  <xsl:if test="verc:NickName">
                     <xsl:value-of select="verc:NickName"/>
                     <br/>
                  </xsl:if>
                  <xsl:if test="verc:Weight">
                     <xsl:value-of select="verc:Weight"/> кг</xsl:if>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template name="Parasites">
      <tr>
         <td class="graph10">Животные обработаны против паразитов:</td>
      </tr>
      <tr>
         <td>
            <table style="width:170mm">
               <xsl:for-each select="verc:ProcessingParasites">
                  <tr>
                     <td class="graph10" style="width:100mm">
                        <xsl:value-of select="verc:NameProcessing"/>
                     </td>
                     <td class="graph10" style="width:70mm">
                        <xsl:for-each select="verc:DateProcessing">
                           <xsl:call-template name="Date"/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </xsl:for-each>
            </table>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Vacination">
      <tr>
         <td class="graph10">Проведена иммунизация против:</td>
      </tr>
      <tr>
         <td>
            <table style="width:170mm">
               <xsl:for-each select="verc:Immunization">
                  <tr>
                     <td class="graph10" style="width:100mm">
                        <xsl:value-of select="verc:NameProcessing"/>
                     </td>
                     <td class="graph10" style="width:70mm">
                        <xsl:for-each select="verc:DateProcessing">
                           <xsl:call-template name="Date"/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </xsl:for-each>
            </table>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Locality">
      <tr>
         <td class="graph10">Животные выходят из местности, где не регистрировались:</td>
      </tr>
      <tr>
         <table style="width:170mm">
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
         </table>
      </tr>
   </xsl:template>
   <xsl:template name="Farm">
      <tr>
         <td class="graph10">Животные выходят из хозяйств, где не регистрировались:</td>
      </tr>
      <tr>
         <table style="width:170mm">
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td>_____________________________</td>
               <td class="graph10">в течение последних  <td>______________________</td>
               </td>
            </tr>
         </table>
      </tr>
   </xsl:template>
   <xsl:template name="Laboratory">
      <tr>
         <td class="graph10">Животные  в  период   
									<xsl:if test="verc:Quarantine">
               <xsl:value-of select="verc:Quarantine/verc:NumberDays"/>
            </xsl:if>
									-дневного    карантина   исследовались   в 
государственной  ветеринарной  лаборатории,  имеющей разрешение на такие исследования, с отрицательным результатом на:</td>
      </tr>
      <tr>
         <table style="width:170mm">
            <xsl:for-each select="verc:ResearchLaboratory">
               <tr>
                  <td class="graph10">
                     <xsl:if test="verc:SickName">
                        <xsl:value-of select="verc:SickName"/>
                     </xsl:if>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="verc:DateExamination">
                        <xsl:call-template name="Date"/>
                     </xsl:for-each>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
      </tr>
   </xsl:template>
   <xsl:template name="LaboratoryResults">
      <table class="items" style="width:170mm">
         <tr>
            <td align="center" class="graph10">Наименование болезни</td>
            <td align="center" class="graph10">Дата исследования</td>
            <td align="center" class="graph10">Метод исследования</td>
            <td align="center" class="graph10">Результаты исследования</td>
         </tr>
         <xsl:for-each select="verc:ResearchLaboratory">
            <tr>
               <td class="graph10">
                  <xsl:if test="verc:SickName">
                     <xsl:value-of select="verc:SickName"/>
                  </xsl:if>
               </td>
               <td class="graph10">
                  <xsl:for-each select="verc:DateExamination">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
               <td class="graph10">
                  <xsl:if test="verc:MethodExamination">
                     <xsl:value-of select="verc:MethodExamination"/>
                  </xsl:if>
               </td>
               <td class="graph10">
                  <xsl:value-of select="verc:ResultExamination"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template name="Signature">
      <table style="width:170mm">
         <tr>
            <td class="graph10">Составлено 
	<xsl:for-each select="verc:DateCertf">
                  <xsl:call-template name="Date"/>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="graph10">Ветеринарный сертификат выдал 
	<xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/> </xsl:if>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
               <xsl:text> </xsl:text>
               <xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph8"> (полное название должности, фамилия, и., о. ветеринарного врача, выдавшего ветеринарный сертификат)</td>
         </tr>
         <tr>
            <td class="graph10">Подпись: _________________________________________</td>
         </tr>
         <tr>
            <td class="graph10">Печать</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Signature2">
      <table align="right" style="width:170mm">
         <tr>
            <td class="graph10" rowspan="4">Печать</td>
            <td class="graph10">Ветеринарный сертификат выдал</td>
         </tr>
         <tr>
            <td class="graph10">
               <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/> </xsl:if>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
               <xsl:text> </xsl:text>
               <xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph8"> (подпись и полное наименование должности)</td>
         </tr>
         <tr>
            <td class="graph10">Подпись: _________________________________________</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Signature2a">
      <table style="width:170mm">
         <tr>
            <td class="graph10">Ветеринарный сертификат получил</td>
            <td class="graph10">Ветеринарный сертификат выдал</td>
         </tr>
         <tr>
            <td class="graph10">
               <xsl:if test="verc:IssueOrganization/cat_ru:OrganizationName">
                  <xsl:value-of select="verc:IssueOrganization/cat_ru:OrganizationName"/>
               </xsl:if>
            </td>
            <td class="graph10">
               <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/> </xsl:if>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
               <xsl:text> </xsl:text>
               <xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName">
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph8"> (подпись и полное наименование должности)</td>
            <td align="center" class="graph8"> (подпись и полное наименование должности)</td>
         </tr>
         <tr>
            <td class="graph10">Подпись: _______________________________</td>
            <td class="graph10">Подпись: _______________________________</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Form6.1">
      <xsl:variable name="LocationTime" select="verc:ProductInfo/verc:LocationCU"/>
      <tr>
         <td class="graph10">в том, что при ветеринарном осмотре подлежащих отправке 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductName"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указать вид животных, биологических объектов)</td>
      </tr>
      <tr>
         <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				 <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                  <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
               <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
				  голов (мест, штук)</td>
      </tr>
      <tr>
         <td class="graph10">больных   и   подозрительных по заболеванию заразными болезнями не обнаружено и они выходят (вывозятся) из 
				<xsl:if test="verc:Sender/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/>
            </xsl:if>
            <xsl:for-each select="verc:Sender/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указать наименование организации-отправителя, полный адрес, в т.ч. название населенного пункта, улицы и номера дома, района, области, края, автономного образования или республики в составе Российской Федерации)</td>
      </tr>
      <tr>
         <td class="graph10">благополучного по особо опасным и карантинным болезням животных. При отправке на экспорт указывают  благополучие хозяйства и местности согласно требованиям страны-импортера и срок их благополучия (мес., лет) 
				<xsl:for-each select="verc:WellBeingInfo/verc:DescriptionWellBeing">
               <xsl:value-of select="."/> 
				</xsl:for-each>
            <xsl:if test="verc:WellBeingInfo/verc:TermWellBeing">
               <xsl:value-of select="verc:WellBeingInfo/verc:TermWellBeing"/> </xsl:if>
            <xsl:if test="verc:WellBeingInfo/verc:UnitTermWellBeing">
               <xsl:value-of select="verc:WellBeingInfo/verc:UnitTermWellBeing"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <xsl:variable name="LocationTime1" select="verc:LocationCU"/>
         <td class="graph10">Животные находились в Российской Федерации:  
				<xsl:choose>
               <xsl:when test="$LocationTime1=1">
					с рождения
					</xsl:when>
               <xsl:when test="$LocationTime1=2">
					не менее 6 месяцев
					</xsl:when>
               <xsl:when test="$LocationTime1=3">
                  <xsl:if test="verc:TimeLocation">
                     <xsl:value-of select="verc:TimeLocation"/>
                  </xsl:if>
					 месяцев.
					</xsl:when>
            </xsl:choose>
         </td>
      </tr>
      <tr>
         <td class="graph10">Животные перед отправкой карантинировались 
				<xsl:if test="verc:Quarantine">
               <xsl:value-of select="verc:Quarantine/verc:NumberDays"/> </xsl:if>
            <xsl:if test="verc:Quarantine">
               <xsl:value-of select="verc:Quarantine/verc:PlaseQuarantine"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(место карантинирования и количество дней)</td>
      </tr>
      <tr>
         <td class="graph10">В   период   карантинирования животные не имели контакта с другими животными; ежедневно   клинически осматривались и у них измерялась температура тела; в день выдачи свидетельства обследованы, больных и подозрительных в заболевании не выявлено.</td>
      </tr>
      <tr>
         <td class="graph10">В   период   карантинирования    материал от животных исследовался в государственной ветеринарной лаборатории 
				<xsl:for-each select="verc:ResearchLaboratory">
               <xsl:value-of select="verc:NameLaboratory"/> </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указать наименование лаборатории)</td>
      </tr>
      <tr>
         <td class="graph10">и были получены следующие результаты:
</td>
      </tr>
      <tr>
         <td>
            <xsl:call-template name="LaboratoryResults"/>
         </td>
      </tr>
      <tr>
         <td>
            <xsl:call-template name="Vacination"/>
         </td>
      </tr>
      <tr>
         <td>
            <xsl:call-template name="Parasites"/>
         </td>
      </tr>
      <tr>
         <td class="graph10">Упаковочный   материал   и    сопровождающие   грузы    происходят непосредственно  из   хозяйства-поставщика  и не   контаминированы возбудителями инфекционных болезней. Животные направляются 
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:for-each select="verc:Receiver/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(пункт назначения и получатель)</td>
      </tr>
      <tr>
         <td class="graph10">при спецификации (гуртовой ведомости, накладной) N 
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
               <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/>
            </xsl:if>
				 от 
				<xsl:for-each select="verc:ShippingDocuments/cat_ru:PrDocumentDate">
               <xsl:call-template name="Date"/>
            </xsl:for-each>
				для 
				<xsl:if test="verc:ReasonSending">
               <xsl:value-of select="verc:ReasonSending"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(откорма, разведения, продажи, убоя и т.д.)</td>
      </tr>
      <tr>
         <td class="graph10">и следуют 
				<xsl:for-each select="verc:TransportInfo">
               <xsl:if test="verc:TransportName">
                  <xsl:value-of select="verc:TransportName"/> </xsl:if>
               <xsl:if test="verc:TransportNumber">
                  <xsl:value-of select="verc:TransportNumber"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(железнодорожным, водным, автомобильным, воздушным транспортом; N автомобиля, вагона, название судна, N рейса и т.д.)</td>
      </tr>
      <tr>
         <td class="graph10">по маршруту: 
				<xsl:if test="verc:Route">
               <xsl:value-of select="verc:Route"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указать основные пункты следования)</td>
      </tr>
      <tr>
         <td class="graph10">ОСОБЫЕ ОТМЕТКИ: 
				<xsl:for-each select="verc:SpecialNotes">
               <xsl:value-of select="."/> 
				</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph10"/>
      </tr>
      <tr>
         <td align="center" class="graph8">(заполняется при отправке животных, переболевших особо опасными заболеваниями, перевозке на особых условиях и по специальному разрешению (указанию), кем оно дано, номер и дата)</td>
      </tr>
      <tr>
         <td class="graph10">
            <xsl:for-each select="verc:MarkInspection">
               <xsl:value-of select="verc:NamePlace"/> 
				<xsl:for-each select="verc:DateInspection"/>
               <xsl:call-template name="Date_2"/> 
				</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(отметки об осмотре при погрузке, выгрузке, в пути следования)</td>
      </tr>
   </xsl:template>
   <xsl:template name="Form6.2">
      <tr>
         <td class="graph10">в том, что 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductName"/>
               <xsl:if test="position()!=last()">, </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование продукции)</td>
      </tr>
      <tr>
         <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
			<xsl:if test="verc:ProductQuantity/verc:MeasureUnitQualifier">
                  <xsl:value-of select="verc:ProductQuantity/verc:MeasureUnitQualifier"/> </xsl:if>
               <xsl:if test="verc:ProductPacking">
                  <xsl:value-of select="verc:ProductPacking"/> </xsl:if>
               <xsl:if test="verc:ProductMark">
                  <xsl:value-of select="verc:ProductMark"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(мест, штук, кг)      (упаковка)    (маркировка)</td>
      </tr>
      <tr>
         <td class="graph10">выработанная 
				<xsl:if test="verc:Manufacturer/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:if test="verc:Manufacturer/verc:OwnersManufacturer">
               <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> </xsl:if>
            <xsl:for-each select="verc:Manufacturer/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование предприятия, ф.и.о. владельца, адрес)</td>
      </tr>
      <tr>
         <td class="graph10">
            <xsl:if test="verc:DateManufactur">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="verc:DateManufactur"/>
               </xsl:call-template>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(дата выработки)</td>
      </tr>
      <tr>
         <xsl:variable name="Examination" select="verc:Examination"/>
         <td class="graph10">
            <xsl:choose>
               <xsl:when test="$Examination='false' or $Examination='f' or $Examination='0'">
					подвергнута ветеринарно-санитарной экспертизе в полном объеме и признана годной для: 
					</xsl:when>
               <xsl:otherwise>
					изготовлена из сырья, прошедшего ветеринарно-санитарную экспертизу и признана годной для: 
					</xsl:otherwise>
            </xsl:choose>
            <xsl:variable name="DeemedFit" select="verc:ProductInfo/verc:DeemedFit"/>
            <xsl:choose>
               <xsl:when test="$DeemedFit=1">реализации без ограничений 
					</xsl:when>
               <xsl:when test="$DeemedFit=2">реализации с ограничением 
					</xsl:when>
               <xsl:when test="$DeemedFit=3">переработки 
					</xsl:when>
               <xsl:when test="$DeemedFit=4">использование без ограничений 
					</xsl:when>
               <xsl:when test="$DeemedFit=5">использование с ограничением 
					</xsl:when>
            </xsl:choose>
            <xsl:if test="verc:CauseRestrictions">
               <xsl:value-of select="verc:CauseRestrictions"/>
            </xsl:if>
         </td>
      </tr>
			 __<tr>
         <td align="center" class="graph8">(реализации без ограничений, с ограничением - указать причины)/(или переработки согласно правилам ветсанэкспертизы)</td>
      </tr>
      <tr>
         <td class="graph10">выходит из 
				<xsl:if test="verc:Location/verc:PlaceLocation">
               <xsl:value-of select="verc:Location/verc:PlaceLocation"/> </xsl:if>
            <xsl:for-each select="verc:Location/verc:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8"> (адрес и местонахождение продукции)</td>
      </tr>
      <tr>
         <td class="graph10">и направляется 
				<xsl:for-each select="verc:TransportInfo">
               <xsl:if test="verc:TransportName">
                  <xsl:value-of select="verc:TransportName"/> </xsl:if>
               <xsl:if test="verc:TransportNumber">
                  <xsl:value-of select="verc:TransportNumber"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each> 
		<xsl:if test="verc:Route">
               <xsl:value-of select="verc:Route"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(вид транспорта, маршрут следования, условия перевозки)</td>
      </tr>
      <tr>
         <td class="graph10">в 
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:for-each select="verc:Receiver/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование и адрес получателя)</td>
      </tr>
      <tr>
         <td class="graph10">по 
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
               <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/>
				 </xsl:if>
            <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
               <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/>
            </xsl:if>
				 от 
				<xsl:for-each select="verc:ShippingDocuments/cat_ru:PrDocumentDate">
               <xsl:call-template name="Date"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование, N и дата выдачи товаротранспортного документа)</td>
      </tr>
      <tr>
         <td class="graph10">Продукция подвергнута дополнительным лабораторным исследованиям 
				<xsl:for-each select="verc:ResearchLaboratory">
               <xsl:value-of select="verc:NameLaboratory"/> 
				<xsl:if test="verc:NumberExamination">
                  <xsl:value-of select="verc:NumberExamination"/> </xsl:if>
               <xsl:value-of select="verc:ResultExamination"/>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование лаборатории, N экспертизы и результаты исследования)</td>
      </tr>
      <tr>
         <td class="graph10">ОСОБЫЕ ОТМЕТКИ 
				<xsl:for-each select="verc:SpecialNotes">
               <xsl:value-of select="."/> 
				</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)</td>
      </tr>
      <tr>
         <td class="graph10">Транспортное средство очищено и продезинфицировано.</td>
      </tr>
      <tr>
         <td class="graph10">Сертификат     предъявляется    для    контроля    и    передается
грузополучателю.      Отметки об  осмотре   при погрузке, в   пути
следования   и при выгрузке делаются на обороте.</td>
      </tr>
      <tr>
         <td class="graph10">Копии сертификата недействительны.</td>
      </tr>
   </xsl:template>
   <xsl:template name="Form6.3">
      <tr>
         <td class="graph10">в том, что 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductName"/> 
				</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование технического сырья или кормов)</td>
      </tr>
      <tr>
         <td class="graph10">в количестве 
				<xsl:for-each select="verc:ProductInfo">
               <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
			<xsl:if test="verc:ProductQuantity/verc:MeasureUnitQualifier">
                  <xsl:value-of select="verc:ProductQuantity/verc:MeasureUnitQualifier"/> </xsl:if>
               <xsl:if test="verc:ProductPacking">
                  <xsl:value-of select="verc:ProductPacking"/> </xsl:if>
               <xsl:if test="verc:ProductMark">
                  <xsl:value-of select="verc:ProductMark"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(мест, штук, кг)      (упаковка)    (маркировка)</td>
      </tr>
      <tr>
         <td class="graph10">происхождение 
				<xsl:if test="verc:ProductOrigin">
               <xsl:value-of select="verc:ProductOrigin"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(боенское, палое, сборное, полученное от здоровых или больных животных)</td>
      </tr>
      <tr>
         <td class="graph10">выработано (заготовлено) под контролем госветслужбы 
				<xsl:if test="verc:Manufacturer/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Manufacturer/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:if test="verc:Manufacturer/verc:OwnersManufacturer">
               <xsl:value-of select="verc:Manufacturer/verc:OwnersManufacturer"/> </xsl:if>
            <xsl:for-each select="verc:Manufacturer/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <xsl:variable name="Examination" select="verc:Examination"/>
         <td class="graph10">
				и признана годной для: 
		<xsl:variable name="DeemedFit" select="verc:DeemedFit"/>
            <xsl:choose>
               <xsl:when test="$DeemedFit=1">реализации без ограничений 
					</xsl:when>
               <xsl:when test="$DeemedFit=2">реализации с ограничением 
					</xsl:when>
               <xsl:when test="$DeemedFit=3">переработки 
					</xsl:when>
               <xsl:when test="$DeemedFit=4">использование без ограничений 
					</xsl:when>
               <xsl:when test="$DeemedFit=5">использование с ограничением 
					</xsl:when>
            </xsl:choose>
            <xsl:if test="verc:CauseRestrictions">
               <xsl:value-of select="verc:CauseRestrictions"/>
            </xsl:if>
         </td>
      </tr>
			 __<tr>
         <td align="center" class="graph8">(реализации без ограничений, с ограничением - указать причины)/(или переработки согласно правилам ветсанэкспертизы)</td>
      </tr>
      <tr>
         <td class="graph10">выходит из 
				<xsl:if test="verc:Location/verc:PlaceLocation">
               <xsl:value-of select="verc:Location/verc:PlaceLocation"/> </xsl:if>
            <xsl:for-each select="verc:Location/verc:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8"> (адрес и местонахождение продукции)</td>
      </tr>
      <tr>
         <td class="graph10">и направляется 
				<xsl:for-each select="verc:TransportInfo">
               <xsl:if test="verc:TransportName">
                  <xsl:value-of select="verc:TransportName"/> </xsl:if>
               <xsl:if test="verc:TransportNumber">
                  <xsl:value-of select="verc:TransportNumber"/>
               </xsl:if>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each> 
		<xsl:if test="verc:Route">
               <xsl:value-of select="verc:Route"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(вид транспорта, маршрут следования)</td>
      </tr>
      <tr>
         <td class="graph10">в 
				<xsl:if test="verc:Receiver/cat_ru:OrganizationName">
               <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
            <xsl:for-each select="verc:Receiver/cat_ru:Address">
               <xsl:call-template name="Address"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование и адрес получателя)</td>
      </tr>
      <tr>
         <td class="graph10">по 
				<xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentName">
               <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentName"/>
				 </xsl:if>
            <xsl:if test="verc:ShippingDocuments/cat_ru:PrDocumentNumber">
               <xsl:value-of select="verc:ShippingDocuments/cat_ru:PrDocumentNumber"/>
            </xsl:if>
				 от 
				<xsl:for-each select="verc:ShippingDocuments/cat_ru:PrDocumentDate">
               <xsl:call-template name="Date"/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(наименование, N и дата выдачи товаротранспортного документа)</td>
      </tr>
      <tr>
         <td class="graph10">Сырье (корма) подвергнуты 
				<xsl:for-each select="verc:ResearchLaboratory">
               <xsl:value-of select="verc:NameLaboratory"/> 
				<xsl:if test="verc:NumberExamination">
                  <xsl:value-of select="verc:NumberExamination"/> </xsl:if>
               <xsl:value-of select="verc:ResultExamination"/>
               <xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(дезинфекции, мойке, консервации - указать метод и наименование препаратов, исследованиям - указать наименование лаборатории, N экспертизы и результаты исследования)</td>
      </tr>
      <tr>
         <td class="graph10">ОСОБЫЕ ОТМЕТКИ 
				<xsl:for-each select="verc:SpecialNotes">
               <xsl:value-of select="."/> 
				</xsl:for-each>
         </td>
      </tr>
      <tr>
         <td align="center" class="graph8">(указываются эпизоотическое благополучие местности, дата и номер разрешения на вывоз продукции за пределы территории, перечисляются N N клейм и др.)</td>
      </tr>
      <tr>
         <td class="graph10">Транспортное средство очищено и продезинфицировано.</td>
      </tr>
      <tr>
         <td class="graph10">Сертификат     предъявляется    для    контроля    и    передается
грузополучателю.      Отметки об  осмотре   при погрузке, в   пути
следования   и при выгрузке делаются на обороте.</td>
      </tr>
      <tr>
         <td class="graph10">Копии сертификата недействительны.</td>
      </tr>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="verc:VeterinaryCertificate">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
                    div.page {
                        width: 210mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 0pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                     table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    
                     .graph {
							font-family: Arial;
							font-size: 10pt;
					}
                    
                    </style>
         <xsl:variable name="Type" select="verc:NumberForm"/>
         <xsl:choose>
            <xsl:when test="$Type=6.1">
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2"/>
                     <xsl:call-template name="Form6.1"/>
                     <tr>
                        <td class="graph10">
                           <p>Транспортное средство очищено и продезинфицировано.</p>
                           <p>Сертификат   предъявляется    для  контроля  при  погрузке, в пути следования и передается грузополучателю.</p>
                           <p>Копии сертификата недействительны.</p>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2"/>
                        </td>
                     </tr>
                  </table>
               </div>
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2a"/>
                     <xsl:call-template name="Form6.1"/>
                     <tr>
                        <td class="graph10">
                           <p>Сертификат   предъявляется    для  контроля  при  погрузке, в пути следования и передается грузополучателю.</p>
                           <p>Копии сертификата недействительны.</p>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2a"/>
                        </td>
                     </tr>
                  </table>
               </div>
            </xsl:when>
            <xsl:when test="$Type=6.2">
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2"/>
                     <xsl:call-template name="Form6.2"/>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:call-template name="Inspection"/>
                        </td>
                     </tr>
                  </table>
               </div>
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2a"/>
                     <xsl:call-template name="Form6.2"/>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2a"/>
                        </td>
                     </tr>
                  </table>
               </div>
            </xsl:when>
            <xsl:when test="$Type=6.3">
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2"/>
                     <xsl:call-template name="Form6.3"/>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:call-template name="Inspection"/>
                        </td>
                     </tr>
                  </table>
               </div>
               <div>
                  <table style="width:170mm">
                     <xsl:call-template name="Form2a"/>
                     <xsl:call-template name="Form6.3"/>
                     <tr>
                        <td>
                           <xsl:call-template name="Signature2a"/>
                        </td>
                     </tr>
                  </table>
               </div>
            </xsl:when>
            <xsl:when test="($Type='5a') or ($Type='5A')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемых из Российской Федерации убойных, </p>
                        <p>племенных и других животных, птицу, пчел и расплод пчел</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td class="graph10">Количество животных 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/> 
				<xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
                              <xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
                           <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode">(<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <xsl:variable name="NumberofAnimals" select="verc:ProductInfo/verc:ProductQuantity/cat_ru:GoodsQuantity"/>
                  <xsl:choose>
                     <xsl:when test="$NumberofAnimals > 5"/>
                     <xsl:otherwise>
                        <tr>
                           <td class="graph10">
                              <xsl:call-template name="Animals"/>
                           </td>
                        </tr>
                     </xsl:otherwise>
                  </xsl:choose>
                  <tr>
                     <td class="graph10">При    перевозке    более  5 животных составляется опись животных, которая   подписывается   ветеринарным  врачом (должностное  лицо Россельхознадзора)   и   является   неотъемлемой   частью  данного сертификата.</td>
                  </tr>
                  <tr>
                     <td>_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ </td>
                  </tr>
                  <tr>
                     <td class="graph10">* Улей   с   пчелами (пчелиная семья), пчелопакеты (сотовые, бессотовые), пчелиные матки и пр.</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение животных</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td class="graph10">Место происхождения животных (место    рождения или приобретения животных - страна, область, район) 
				<xsl:if test="verc:Location/verc:PlaceLocation">
                           <xsl:value-of select="verc:Location/verc:PlaceLocation"/> </xsl:if>
                        <xsl:for-each select="verc:Location/verc:Address">
                           <xsl:call-template name="Address"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Животные находились в Российской Федерации 
				<xsl:variable name="TimeLocation" select="verc:LocationCU"/>
                        <xsl:choose>
                           <xsl:when test="$TimeLocation=1">с рождения</xsl:when>
                           <xsl:when test="$TimeLocation=2">не менее 6 месяцев</xsl:when>
                           <xsl:when test="$TimeLocation=3">более 6 месяцев</xsl:when>
                        </xsl:choose>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8">(с рождения или не менее 6 мес.)</td>
                  </tr>
                  <tr>
                     <td class="graph10">
                        <tr>
                           <td>__________________________________________________________________________</td>
                        </tr>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8">(Для диких животных указать место отлова)</td>
                  </tr>
                  <tr>
                     <td class="graph10">Место карантинирования 
				<xsl:if test="verc:Quarantine">
                           <xsl:value-of select="verc:Quarantine/verc:PlaseQuarantine"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">2. Направление животных</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">3.  Я,  нижеподписавшийся  государственный  ветеринарный  врач Российской   Федерации   (должностное   лицо Россельхознадзора), удостоверяю,   что   вышеуказанные   животные  прошли  
				<xsl:if test="verc:Quarantine">
                           <xsl:value-of select="verc:Quarantine/verc:NumberDays"/>
                        </xsl:if>
				-дневный карантин  с  ежедневным  клиническим осмотром, не имели контакта с другими  животными,   обследованы в день выдачи сертификата и   не имеют клинических признаков инфекционных заболеваний.</td>
                  </tr>
                  <tr>
                     <td class="graph10">Транспортные средства очищены и продезинфицированы принятыми в Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Locality"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Farm"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Laboratory"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Vacination"/>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Parasites"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Корма и другие сопровождаемые грузы происходят непосредственно  из хозяйства экспортера и не контаминированы возбудителями инфекционных болезней животных.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Сертификат действителен при возвращении в Российскую Федерацию из  зарубежных  стран  животных в течение 90 дней с момента выдачи без проведения дополнительных  исследований  и  обработок  при условии,  что животные не находились в местах, где имелись вспышки инфекционных болезней, что должно быть подтверждено государственной  ветеринарной службой этих стран, при условии если животные в течение 24 часов после его подписания были погружены на транспортное средство.</td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5b') or ($Type='5B')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемое из Российской Федерации фуражное</p>
                        <p>зерно и другие растительные продукты</p>
                        <p>для животноводства</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td class="graph10">Наименование продукции 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductName"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Вес нетто <xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:Weight"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">2. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p>3. Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю,  что  предъявленные  к осмотру указанные растительные
продукты:</p>
                        <p>-  происходят  из местности, свободной по ящуру, везикулярному
стоматиту,  везикулярной  болезни  свиней,  чуме крупного рогатого
скота,  чуме  мелких  жвачных,  контагиозной  плевропневмонии КРС,
заразного   узелкового   дерматита  КРС,  лихорадки  долины  Рифт,
катаральной лихорадки овец, оспе овец  и  коз,   африканской  чуме
лошадей,  африканской  чуме  свиней,  классической   чуме  свиней,
высокопатогенному     гриппу   птиц,   болезни  Ньюкасла в течение
последних 12 месяцев, а также по другим острозаразным инфекционным
болезням,   опасным   для   животных  и птицы, в течение последних
3 месяцев;</p>
                        <p> -  не содержат энтеропатогенных эшерихий и сальмонелл, а также
токсигенных грибов, что подтверждается экспертизой аккредитованной
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие исследования.</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Транспортные средства очищены и продезинфицированы принятыми в Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5c') or ($Type='5C')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемый из Российской Федерации племенной</p>
                        <p>материал (сперму производителей, эмбрионы,</p>
                        <p>инкубационное яйцо, икру и др.)</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td class="graph10">Наименование материала 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductName"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Дата взятия материала 
				<xsl:for-each select="verc:DateManufactur">
                           <xsl:call-template name="Date"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Количество 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Упаковка 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductPacking"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Маркировка 
				<xsl:for-each select="verc:ProductInfo">
                           <xsl:value-of select="verc:ProductMark"/>
                           <xsl:if test="position()!=last()">, </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Условия хранения и перевозки </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">2. Сведения о производителе (доноре)</td>
                  </tr>
                  <tr>
                     <td class="graph10">Вид 
				
				</td>
                  </tr>
                  <tr>
                     <td class="graph10">Порода </td>
                  </tr>
                  <tr>
                     <td class="graph10">Кличка </td>
                  </tr>
                  <tr>
                     <td class="graph10">Дата и место рождения </td>
                  </tr>
                  <tr>
                     <td class="graph10">Дата допуска производителя (донора) для производственных целей </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">3. Направление материала</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p>4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что:</p>
                        <p>- предъявленный к осмотру указанный племенной материал получен
при  соблюдении  установленных  ветеринарно-санитарных  правил  от
производителя  (донора),  который  в день взятия материала не имел
клинических признаков болезней;</p>
                        <p> -  племенной  материал получен на предприятии, находящемся под
постоянным контролем государственной ветеринарной службы;</p>
                        <p> -  производитель  (донор)  находился на предприятии не менее 6
месяцев  до  получения племенного материала и не использовался для
естественного осеменения;</p>
                        <p> - производитель (донор) исследован с отрицательным результатом
в государственной ветеринарной лаборатории,  имеющей разрешение на
такие  исследования,  методами,  принятыми в Российской Федерации,
на:
<xsl:for-each select="verc:ProductInfo/verc:ResearchLaboratory">
                              <xsl:value-of select="verc:SickName"/>
                           </xsl:for-each> 
</p>
                        <p>-  племенной материал вывозится из местности, благополучной по
ящуру,  везикулярному стоматиту, везикулярной болезни свиней, чуме
крупного   рогатого   скота,  чуме  мелких  жвачных,  контагиозной
плевропневмонии КРС, заразного узелкового дерматита КРС, лихорадки
долины  Рифт,  катаральной  лихорадки  овец,  оспе овец   и   коз,
африканской  чуме  лошадей,  африканской чуме свиней, классической
чуме  свиней,  высокопатогенному  гриппу птиц, болезни Ньюкасла, а
также другим болезням данного вида животных.</p>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5d') or ($Type='5D')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемое из Российской Федерации молоко</p>
                        <p>и молочные продукты</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">Время погрузки </td>
                  </tr>
                  <tr>
                     <td class="graph10">Условия транспортировки </td>
                  </tr>
                  <tr>
                     <td class="graph10">
                        <p> 3.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю,   что   предъявленные  к  осмотру  молочные  продукты
(молоко):</p>
                        <p>- получены от здоровых животных;</p>
                        <p> - признаны пригодными для употребления в пищу  по  результатам
ветеринарно-санитарной экспертизы;</p>
                        <p>  -  произведены  на  предприятиях,  находящихся  под постоянным
контролем  государственной ветеринарной службы, имеющих разрешения
на   экспорт  и  отвечающих  ветеринарным  требованиям  Российской
Федерации;</p>
                        <p>-  выходят из местности, благополучной по ящуру, везикулярному
стоматиту,  везикулярной  болезни  свиней,  чуме крупного рогатого
скота,  чуме  мелких  жвачных,  контагиозной  плевропневмонии КРС,
заразного   узелкового   дерматита  КРС,  лихорадки  долины  Рифт,
катаральной  лихорадки овец,   оспе овец и   коз, африканской чуме
лошадей,  африканской  чуме  свиней,  классической  чуме   свиней,
высокопатогенному   гриппу   птиц,  болезни  Ньюкасла   в  течение
последних ____ месяцев, а также:</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  молочные    продукты   перед
отправкой  "__"  ________  20__  г.  исследованы  на радиоактивное
загрязнение  в  государственной  ветеринарной лаборатории, имеющей
разрешение   на   такие   исследования;   уровень   радиоактивного
загрязнения при исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5e')  or ($Type='5E')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации мясо</p>
                        <p>и мясопродукты домашних и диких животных</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">Условия транспортировки </td>
                  </tr>
                  <tr>
                     <td class="graph10">
                        <p> 3.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные  к  осмотру  указанные мясопродукты
(мясо):</p>
                        <p>- получены от убоя здоровых животных;</p>
                        <p> - признаны пригодными для употребления в пищу;</p>
                        <p>-  произведены  на  предприятиях,  находящихся  под постоянным
контролем  государственной ветеринарной службы, имеющих разрешение
на   экспорт  и  отвечающих  ветеринарным  требованиям  Российской
Федерации;</p>
                        <p> -  выходят из местности, благополучной по ящуру, везикулярному
стоматиту,  везикулярной  болезни  свиней,  чуме крупного рогатого
скота,  чуме  мелких  жвачных,  контагиозной  плевропневмонии КРС,
заразного   узелкового   дерматита  КРС,  лихорадки  долины  Рифт,
катаральной  лихорадки овец,   оспе овец и   коз, африканской чуме
лошадей,  африканской  чуме  свиней,   классической  чуме  свиней,
высокопатогенному  гриппу    птиц,   болезни  Ньюкасла  в  течение
последних ____ месяцев, а также:</p>
                        <p>При   проведении   ветеринарно-санитарной   экспертизы   мяса   не
обнаружено изменений, характерных для:</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5f') or ($Type='5F')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемое из Российской Федерации сырье</p>
                        <p>животного происхождения</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">1. Происхождение сырья</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td class="graph10">Происхождение сырья</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8">(сборное, боенское, другие источники)</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">Условия транспортировки </td>
                  </tr>
                  <tr>
                     <td class="graph10">
                        <p> 3.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленное к осмотру указанное сырье:</p>
                        <p>- получено от  убоя здоровых животных на предприятиях, имеющих
разрешение на экспорт сырья;</p>
                        <p>- происходит из  хозяйств и местности, благополучных по ящуру,
везикулярному   стоматиту,   везикулярной   болезни  свиней,  чуме
крупного   рогатого   скота,  чуме  мелких  жвачных,  контагиозной
плевропневмонии КРС, заразного узелкового дерматита КРС, лихорадки
долины  Рифт,  катаральной  лихорадки  овец,  оспе овец   и   коз,
африканской  чуме  лошадей,  африканской чуме свиней, классической
чуме  свиней,  высокопатогенному  гриппу  птиц, болезни Ньюкасла в
течение   последних   3  месяцев,  а  также  сибирской  язве  (для
пушно-мехового  и  кожевенного  сырья) и сальмонеллезу (для пуха и
пера);</p>
                        <p> - сборное кожевенное сырье полностью исследовано  на сибирскую
язву  с  отрицательным  результатом в государственной ветеринарной
лаборатории, имеющей разрешение на такие исследования.</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5g') or ($Type='5G')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации</p>
                        <p> пчелиный мед и продукты пчеловодства</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td class="graph10">Условия транспортировки </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные к осмотру указанные продукты пчеловодства получены от здоровых пчел и выходят из хозяйств и области (республики), благополучных по инфекционным болезням животных и пчел, в том числе:</p>
                        <p>- ящуру крупного рогатого скота - в течение последних 12 месяцев и африканской чуме свиней - в течение последних 3-х лет на территории страны;</p>
                        <p>- акариозу, нозематозу в течение последних 6 месяцев в хозяйстве ;</p>
                        <p> - варроатозу, американскому и европейскому гнильцу - в течение последних 2-ч лет в хозяйстве.</p>
                        <p>Мед. продукты пчеловодства произведены на предпреятиях. находящихся под посоянным контролем государственноц ветеринарной службы. имеющих разрешение на экспорт и отвечающих ветеринарным требованиями Российской Федерации. Пчелиный мед, продукты пчеловодства признаны пригодными в пищу людям и по своим органолептическим показателям не имеют изменений, не содержат антибиотиков, наполнителей, красителей и механических примесей, не характерных для данного вида продуктов.</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера мед   перед   отправкой
"__"  ________  20__ г. исследован на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5h') or ($Type='5H')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации биологическое</p>
                        <p> сырье, предназначенное для производства лекарственных</p>
                        <p>средств. применяемых в ветеренарии (кровь животных</p>
                        <p>и ее фракции, органы и ткани животных, культуры</p>
                        <p>микроорганизмов), коллекции и образцы</p>
                        <p>по зоологии, анатомии, палеонтологии и пр.</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td class="graph10">Условия хранения и транспортировки </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Сведения об экспортируемом материале </td>
                  </tr>
                  <br/>
                  <tr>
                     <td align="center" class="graph10">4. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 5.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю следующее:</p>
                        <p> - предъявленный к осмотру  указанный материал получен при соблюдении установленных ветеринарно-санитарных правил и вывозится из местности, благополучной по ящуру, везикулярному стоматиту, везикулярной болезни свиней, чуме крупного рогатого скота, чуме мелких жвачных,контагиозной плевропневмонии КРС, заразного узелкового дерматита КРС, лихорадки долины Рифт, катаральной лихорадке овец, оспе овец и коз. африканской чуме лошадей, африканской чуме свиней, классической чуме свиней, высокопатогенному гриппу птиц, болезни Ньюкасла, а также другим болезням данного вида животных;</p>
                        <p>- биологические материалы (кровь, сыворотки, культуры микроорганизмов и др.) приготовлены, обработаны, хранились и транспортировались в условиях, соответствующих ветеринарным требованиям Российской Федерации ;</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">Тара, упаковка и транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5i') or ($Type='5I')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации рыбу,</p>
                        <p>ракообразных, моллюсков, водных животных,</p>
                        <p>других объектов промысла и продуктов</p>
                        <p>их переработки</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные  к  осмотру  указанные рыба, ракообразные и другие продукты пресноводного и  морского промысла (водные животные):</p>
                        <p>- выловлены (добыты) в водоеме (районе промысла), находящемсяв местности, благополучной по вирусной геморрагической септицемии, весенней веремии карпа, инфекционному некрозу гемопоэтической ткани лососевых, эпизоотическому гемопоэтическому некрозу,герпесвирусному заболеванию лососевых в течении последних месяцев </p>
                        <p> - выловлены (добыты) и переработаны на суднах, плавбазах и других перерабатывающих предприятиях, находящихся под постоянным контролем государственной ветеринарной службы, имеющих разрешение на экспорт и отвечающих ветеринарный требованиям Российской Федерации;</p>
                        <p>-  выловлены (добыты) в водоеме (районе промысла), благополучном в ветеринарно-санитароном отношении;</p>
                        <p> -  </p>
                        <p>указать подвергались ли ветеринарно-санитарной экспертизе</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5j') or ($Type='5J')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации охотничьи,</p>
                        <p>трофеи диких животных, птиц, рыб, рептилий,</p>
                        <p>а так же их частей  и дериватов</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные  к  осмотру  указанные охотничьи трофеи диких животных, птиц,рыб, а так же их части(деривативы) происходят из районов охоты(промысла), благополучных по ящуру, везикулярному стоматиту, везикулярной болезни свиней, чуме крупного рогатого скота, чуме мелких жвачных, контагиозной плевропневмонии КРС, заразного узелкового дерматита КРС, лихорадки долины Рифт, катаральной лихорадки овец, оспе овец и коз, африканской чуме лошадей, африканской чуме свиней, классической чуме свиней, высокопатогенному гриппу птиц, болезни Ньюкасла в течении последних 12 месяцев, а также:</p>
                        <p> - переработаны на специальных перерабатывающих предприятиях (хозяйствах) с соблюдением ветеринарно-санитарных правил и подвергнуты лаборатнорным исследованиям на сибирскую язву с отрицательным результатом;</p>
                        <p>- хранились и транспортировались в условиях, соответствующих требованиям Государственной ветеринарной службы;</p>
                        <p> -  признаны пригодными для коллекционирования, выставок, научных исследований и других целей.</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5k') or ($Type='5K')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации яйцо птицы</p>
                        <p>столовое и яичный порошок</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные  к  осмотру  указанное яйцо получено от здорой птицы и происходит из хозяйств и области благополучных по инфекционным болезням птиц, в том числе:</p>
                        <p>- по орнитозу(пситтакозу), болезни Ньюкасла, сальмонеллезу. парвовирусной инфекции. инфекционному ларинготрахеиту, инфекционному энцеломиелиту, туберкулезу в течении последних 6 месяцев. </p>
                        <br/>
                        <p> Территория всей страны в течении последних 3-х лет свободна от африканской чумы свиней и последних 12 месяцев - от ящура.</p>
                        <br/>
                        <p>Яйцо поставлялось с предприятий, имеющих разрешение государственной ветеринарной службы на экспорт и находящихся под ее постоянным ветеринарным контролем. По результатам ветеринарно-санитарной экспертизы признано годным в пищу человеку.</p>
                        <p> Тара и материал для упаковки используются впервые  и удовлетворяют необходимым санитарно-гигиеническим требованиям.</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="($Type='5l') or ($Type='5L')">
               <table style="width:170mm">
                  <xsl:call-template name="Form"/>
                  <tr>
                     <td align="center" class="graph10">
                        <p>на экспортируемые из Российской Федерации рыбу,</p>
                        <p>ракообразных, моллюсков, водных животных,</p>
                        <p>других объектов промысла и продуктов</p>
                        <p>их переработки</p>
                     </td>
                  </tr>
                  <xsl:call-template name="Department"/>
                  <tr>
                     <td align="center" class="graph10">1. Идентификация продукции</td>
                  </tr>
                  <xsl:call-template name="ProductInfo"/>
                  <tr>
                     <td align="center" class="graph10">2. Происхождение продукции</td>
                  </tr>
                  <xsl:call-template name="Exporter"/>
                  <tr>
                     <td align="center" class="graph10">3. Направление продукции</td>
                  </tr>
                  <xsl:call-template name="ProductDirection"/>
                  <tr>
                     <td class="graph10">
                        <p> 4.  Я,  нижеподписавшийся  государственный  ветеринарный  врач
Российской   Федерации   (должностное   лицо   Россельхознадзора),
удостоверяю, что предъявленные  к  осмотру  указанные рыба, ракообразные и другие продукты пресноводного и  морского промысла (водные животные):</p>
                        <p>- выловлены (добыты) в водоеме (районе промысла), находящемсяв местности, благополучной по вирусной геморрагической септицемии, весенней веремии карпа, инфекционному некрозу гемопоэтической ткани лососевых, эпизоотическому гемопоэтическому некрозу,герпесвирусному заболеванию лососевых в течении последних месяцев </p>
                        <p> - признаны пригодными для употребления в пищу;</p>
                        <p>-  произведены  на  предприятиях,  находящихся  под постоянным
контролем  государственной ветеринарной службы, имеющих разрешение
на   экспорт  и  отвечающих  ветеринарным  требованиям  Российской
Федерации;</p>
                        <p> -  выходят из местности, благополучной по ящуру, везикулярному
стоматиту,  везикулярной  болезни  свиней,  чуме крупного рогатого
скота,  чуме  мелких  жвачных,  контагиозной  плевропневмонии КРС,
заразного   узелкового   дерматита  КРС,  лихорадки  долины  Рифт,
катаральной  лихорадки овец,   оспе овец и   коз, африканской чуме
лошадей,  африканской  чуме  свиней,   классической  чуме  свиней,
высокопатогенному  гриппу    птиц,   болезни  Ньюкасла  в  течение
последних ____ месяцев, а также:</p>
                        <p>При   проведении   ветеринарно-санитарной   экспертизы   мяса   не
обнаружено изменений, характерных для:</p>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10">По  требованию  страны-импортера  мясопродукты   перед   отправкой
"__"  ________  20__ г. исследованы на радиоактивное загрязнение в
государственной  ветеринарной  лаборатории,  имеющей разрешение на
такие   исследования;   уровень   радиоактивного   загрязнения при
исследовании не превышает ____ беккерель/кг.</td>
                  </tr>
                  <tr>
                     <td class="graph10"> Транспортные средства очищены и продезинфицированы принятыми в
Российской Федерации методами и средствами.</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="Signature"/>
                     </td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:when test="$Type='01' or $Type='1'">
               <table style="width:170mm">
                  <xsl:call-template name="Form1"/>
               </table>
            </xsl:when>
            <xsl:when test="$Type='02' or $Type='2'">
               <table style="width:170mm">
                  <xsl:call-template name="Form02"/>
               </table>
            </xsl:when>
            <xsl:when test="$Type='03' or $Type='3'">
               <table style="width:170mm">
                  <xsl:call-template name="Form03"/>
               </table>
            </xsl:when>
            <xsl:when test="$Type='04' or $Type='4'">
               <table style="width:170mm">
                  <xsl:call-template name="Form04"/>
               </table>
            </xsl:when>
            <xsl:when test="$Type='11'">
               <div class="page">
                  <table style="border-collapse:collapse">
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;">1. Описание поставки</td>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1.5. Сертификат № <u>
                              <xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;" valign="top">1.1. Название и адрес грузоотправителя:<br/>
                           <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Sender/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Sender/cat_ru:Address">
				<xsl:apply-templates select="verc:Sender/cat_ru:Address"/></xsl:if>-->
                        </td>
                        <td align="center" class="graph" colspan="4" rowspan="3" style="border:solid 1pt #000000;">Ветеринарный сертификат на <br/>временный ввоз на таможенную <br/>территорию Таможенного союза <br/>Республики Беларусь, Республики <br/>Казахстан и Российской Федерации <br/>спортивных лошадей для участия <br/>в соревнованиях</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;" valign="top">1.2. Название и адрес грузополучателя:<br/>
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Receiver/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Receiver/cat_ru:Address">
				<xsl:apply-templates select="verc:Receiver/cat_ru:Address"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" rowspan="5" style="border:solid 1pt #000000;" valign="top">1.3. Транспорт:<br/>
				(№ вагона, автомашины, контейнера, рейса самолета, название судна)<br/>
                           <xsl:for-each select="verc:TransportInfo">
                              <xsl:if test="verc:TransportName">
                                 <xsl:value-of select="verc:TransportName"/>
                              </xsl:if>
                              <xsl:if test="verc:TransportNumber"> №<xsl:value-of select="verc:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.6. Страна происхождения животных:<br/>
                           <xsl:if test="verc:ProductOrigin">
                              <xsl:value-of select="verc:ProductOrigin"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1.7. Страна, выдавшая сертификат:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:IssueCountry">
                              <xsl:value-of select="verc:RegistrationInfo/verc:IssueCountry"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1.8. Компетентное ведомство страны-экспортера:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:CompetentAuthority">
                              <xsl:value-of select="verc:RegistrationInfo/verc:CompetentAuthority"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="2" style="border:solid 1pt #000000;">1.9. Учреждение страны-экспортера, выдавшее сертификат:<br/>
                           <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.4. Страна (ы) транзита:<br/>
                           <xsl:if test="verc:Route">
                              <xsl:value-of select="verc:Route"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1.10. Пункт пропуска товаров через таможенную границу:<br/>
                           <xsl:if test="verc:BorderOffice">
                              <xsl:value-of select="verc:BorderOffice"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="10" style="border:solid 1pt #000000;">2. Идентификация животных:<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">№<br/>п/п</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Вид животного</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Пол</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Порода</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;"> Возраст</td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;">Идентифи-<br/>кационный<br/>номер</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Клеймо</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Кличка</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Вес</td>
                     </tr>
                     <xsl:for-each select="verc:ProductInfo">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="position()"/>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="verc:ProductName"/>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Sex">
                                 <xsl:value-of select="verc:Sex"/>
                              </xsl:if>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Breed">
                                 <xsl:value-of select="verc:Breed"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Age">
                                 <xsl:value-of select="verc:Age"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:IDNumber">
                                 <xsl:value-of select="verc:IDNumber"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Brand">
                                 <xsl:value-of select="verc:Brand"/>
                              </xsl:if>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:NickName">
                                 <xsl:value-of select="verc:NickName"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Weight">
                                 <xsl:value-of select="verc:Weight"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <xsl:call-template name="Name4.1"/>
                     <xsl:call-template name="Name4.2"/>
                     <xsl:call-template name="Name4.3"/>
                     <xsl:call-template name="Name4.4"/>
                     <xsl:call-template name="Name"/>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </table>
                  <xsl:call-template name="End"/>
               </div>
            </xsl:when>
            <xsl:when test="$Type='14'">
               <div class="page">
                  <table style="border-collapse:collapse">
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1. Описание поставки</td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;">1.5. Сертификат № <u>
                              <xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.1. Название и адрес грузоотправителя:<br/>
                           <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Sender/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Sender/cat_ru:Address">
				<xsl:apply-templates select="verc:Sender/cat_ru:Address"/></xsl:if>-->
                        </td>
                        <td align="center" class="graph" colspan="2" rowspan="3" style="border:solid 1pt #000000;">Ветеринарный сертификат на <br/>экспортируемых на таможенную <br/>территорию Таможенного союза <br/>Республики Беларусь, Республики <br/>Казахстан и Российской Федерации <br/>суточных цыплят, индюшат, утят, гусят,<br/>страусят и инкубационные яйца<br/>этих видов птиц</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.2. Название и адрес грузополучателя:<br/>
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Receiver/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Receiver/cat_ru:Address">
				<xsl:apply-templates select="verc:Receiver/cat_ru:Address"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="5" style="border:solid 1pt #000000;" valign="top">1.3. Транспорт:<br/>
				(№ вагона, автомашины, контейнера, рейса самолета, название судна)<br/>
                           <xsl:for-each select="verc:TransportInfo">
                              <xsl:if test="verc:TransportName">
                                 <xsl:value-of select="verc:TransportName"/>
                              </xsl:if>
                              <xsl:if test="verc:TransportNumber"> №<xsl:value-of select="verc:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.6. Страна происхождения животных:<br/>
                           <xsl:if test="verc:ProductOrigin">
                              <xsl:value-of select="verc:ProductOrigin"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.7. Страна, выдавшая сертификат:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:IssueCountry">
                              <xsl:value-of select="verc:RegistrationInfo/verc:IssueCountry"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.8. Компетентное ведомство страны-экспортера:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:CompetentAuthority">
                              <xsl:value-of select="verc:RegistrationInfo/verc:CompetentAuthority"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.9. Учреждение страны-экспортера, выдавшее сертификат:<br/>
                           <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.4. Страна (ы) транзита:<br/>
                           <xsl:if test="verc:Route">
                              <xsl:value-of select="verc:Route"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.10. Пункт пропуска товаров через таможенную границу:<br/>
                           <xsl:if test="verc:BorderOffice">
                              <xsl:value-of select="verc:BorderOffice"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;">2. Идентификация продукции:<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">№<br/>п/п</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Вид птицы (инкубацинных яиц)</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Порода</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;"> Маркировка</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Упаковка</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Количество</td>
                     </tr>
                     <xsl:for-each select="verc:ProductInfo">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="position()"/>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="verc:ProductName"/>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Breed">
                                 <xsl:value-of select="verc:Breed"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:ProductMark">
                                 <xsl:value-of select="verc:ProductMark"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:ProductPacking">
                                 <xsl:value-of select="verc:ProductPacking"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                                <xsl:value-of select="verc:ProductQuantity/cat_ru:GoodsQuantity"/>
                                <xsl:if test="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName">
									<xsl:text> </xsl:text>
									<xsl:value-of select="verc:ProductQuantity/cat_ru:MeasureUnitQualifierName"/>
                                </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <xsl:call-template name="Name4.1"/>
                     <xsl:call-template name="Name4.2"/>
                     <xsl:call-template name="Name4.3"/>
                     <xsl:call-template name="Name4.4"/>
                     <xsl:call-template name="Name"/>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </table>
                  <xsl:call-template name="End"/>
               </div>
            </xsl:when>
            <xsl:when test="$Type='16'">
               <div class="page">
                  <table style="border-collapse:collapse">
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1. Описание поставки</td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;">1.5. Сертификат № <u>
                              <xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.1. Название и адрес грузоотправителя:<br/>
                           <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Sender/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Sender/cat_ru:Address">
				<xsl:apply-templates select="verc:Sender/cat_ru:Address"/></xsl:if>-->
                        </td>
                        <td align="center" class="graph" colspan="2" rowspan="3" style="border:solid 1pt #000000;">Ветеринарный сертификат на <br/>экспортируемых на таможенную <br/>территорию Таможенного союза <br/>Республики Беларусь, Республики <br/>Казахстан и Российской Федерации <br/>диких животных</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.2. Название и адрес грузополучателя:<br/>
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Receiver/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Receiver/cat_ru:Address">
				<xsl:apply-templates select="verc:Receiver/cat_ru:Address"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="5" style="border:solid 1pt #000000;" valign="top">1.3. Транспорт:<br/>
				(№ вагона, автомашины, контейнера, рейса самолета, название судна)<br/>
                           <xsl:for-each select="verc:TransportInfo">
                              <xsl:if test="verc:TransportName">
                                 <xsl:value-of select="verc:TransportName"/>
                              </xsl:if>
                              <xsl:if test="verc:TransportNumber"> №<xsl:value-of select="verc:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.6. Страна происхождения животных:<br/>
                           <xsl:if test="verc:ProductOrigin">
                              <xsl:value-of select="verc:ProductOrigin"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.7. Страна, выдавшая сертификат:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:IssueCountry">
                              <xsl:value-of select="verc:RegistrationInfo/verc:IssueCountry"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.8. Компетентное ведомство страны-экспортера:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:CompetentAuthority">
                              <xsl:value-of select="verc:RegistrationInfo/verc:CompetentAuthority"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.9. Учреждение страны-экспортера, выдавшее сертификат:<br/>
                           <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.4. Страна (ы) транзита:<br/>
                           <xsl:if test="verc:Route">
                              <xsl:value-of select="verc:Route"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.10. Пункт пропуска товаров через таможенную границу:<br/>
                           <xsl:if test="verc:BorderOffice">
                              <xsl:value-of select="verc:BorderOffice"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;">2. Идентификация животных:<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">№<br/>п/п</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Вид животного</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Пол</td>
                        <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;"> Возраст</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Идентификационный номер</td>
                     </tr>
                     <xsl:for-each select="verc:ProductInfo">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="position()"/>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="verc:ProductName"/>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Sex">
                                 <xsl:value-of select="verc:Sex"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Age">
                                 <xsl:value-of select="verc:Age"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:IDNumber">
                                 <xsl:value-of select="verc:IDNumber"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <xsl:call-template name="Name4.1"/>
                     <xsl:call-template name="Name4.2"/>
                     <xsl:call-template name="Name4.3"/>
                     <xsl:call-template name="Name4.4"/>
                     <xsl:call-template name="Name"/>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </table>
                  <xsl:call-template name="End"/>
               </div>
            </xsl:when>
            <xsl:when test="$Type='30'">
               <div class="page">
                  <table style="border-collapse:collapse">
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1. Описание поставки</td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;">1.5. Сертификат № <u>
                              <xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.1. Название и адрес грузоотправителя:<br/>
                           <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Sender/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Sender/cat_ru:Address">
				<xsl:apply-templates select="verc:Sender/cat_ru:Address"/></xsl:if>-->
                        </td>
                        <td align="center" class="graph" colspan="2" rowspan="3" style="border:solid 1pt #000000;">Ветеринарный сертификат на <br/>экспортируемые на таможенную <br/>территорию Евразийского<br/>экономического союза натуральный мед<br/>и другие продукты пчеловодства</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.2. Название и адрес грузополучателя:<br/>
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Receiver/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Receiver/cat_ru:Address">
				<xsl:apply-templates select="verc:Receiver/cat_ru:Address"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="5" style="border:solid 1pt #000000;" valign="top">1.3. Транспорт:<br/>
				(№ вагона, автомашины, контейнера, рейса самолета, название судна)<br/>
                           <xsl:for-each select="verc:TransportInfo">
                              <xsl:if test="verc:TransportName">
                                 <xsl:value-of select="verc:TransportName"/>
                              </xsl:if>
                              <xsl:if test="verc:TransportNumber"> №<xsl:value-of select="verc:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.6. Страна происхождения животных:<br/>
                           <xsl:if test="verc:ProductOrigin">
                              <xsl:value-of select="verc:ProductOrigin"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.7. Страна, выдавшая сертификат:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:IssueCountry">
                              <xsl:value-of select="verc:RegistrationInfo/verc:IssueCountry"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.8. Компетентное ведомство страны-экспортера:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:CompetentAuthority">
                              <xsl:value-of select="verc:RegistrationInfo/verc:CompetentAuthority"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.9. Учреждение страны-экспортера, выдавшее сертификат:<br/>
                           <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.4. Страна (ы) транзита:<br/>
                           <xsl:if test="verc:Route">
                              <xsl:value-of select="verc:Route"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000;" valign="top">1.10. Пункт пропуска товаров через таможенную границу:<br/>
                           <xsl:if test="verc:BorderOffice">
                              <xsl:value-of select="verc:BorderOffice"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="6" style="border:solid 1pt #000000;">2. Идентификация товара:<br/>
                        <xsl:for-each select="verc:ProductInfo">
							2.1. Наименование товара: <xsl:value-of select="verc:ProductName"/>
							<br/>
							2.2. Дата выработки товара:
							<br/>
							2.3. Упаковка: <xsl:value-of select="verc:ProductPacking"/>
							<br/>
							2.4. Количество мест: <xsl:for-each select="verc:ProductQuantity">
								<xsl:value-of select="cat_ru:GoodsQuantity"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
								<xsl:text> </xsl:text>
								<xsl:if test="cat_ru:MeasureUnitQualifierCode"> (</xsl:if>
								<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
								<xsl:if test="cat_ru:MeasureUnitQualifierCode">)</xsl:if>
							</xsl:for-each>
							<br/>
							2.5. Вес нетто (кг): <xsl:value-of select="verc:Weight"/>
							<br/>
							2.6. Номер пломбы:
							<br/>
							2.7. Маркировка: <xsl:value-of select="verc:ProductMark"/>
							<br/>
							2.8. Условия хранения и перевозки:
                        </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:call-template name="Name4.1"/>
                     <xsl:call-template name="Name4.2"/>
                     <xsl:call-template name="Name4.3"/>
                     <xsl:call-template name="Name4.4"/>
                     <xsl:call-template name="Name"/>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </table>
                  <xsl:call-template name="End"/>
               </div>
            </xsl:when>
            <xsl:when test="$Type='41'">
               <div class="page">
                  <table style="border-collapse:collapse">
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;">1. Описание поставки</td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000;">1.5. Сертификат № <u>
                              <xsl:value-of select="verc:RegistrationInfo/verc:RegistrationNumber"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.1. Название и адрес грузоотправителя:<br/>
                           <xsl:if test="verc:Sender/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Sender/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Sender/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Sender/cat_ru:Address">
				<xsl:apply-templates select="verc:Sender/cat_ru:Address"/></xsl:if>-->
                        </td>
                        <td align="center" class="graph" colspan="3" rowspan="3" style="border:solid 1pt #000000;">Ветеринарный сертификат на <br/>экспортируемых на таможенную <br/>территорию Таможенного союза <br/>Республики Беларусь, Республики <br/>Казахстан и Российской Федерации <br/>зоопарковых и цирковых животных</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000;" valign="top">1.2. Название и адрес грузополучателя:<br/>
                           <xsl:if test="verc:Receiver/cat_ru:OrganizationName">
                              <xsl:value-of select="verc:Receiver/cat_ru:OrganizationName"/> </xsl:if>
                           <xsl:for-each select="verc:Receiver/cat_ru:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                           <!--<xsl:if test="verc:Receiver/cat_ru:Address">
				<xsl:apply-templates select="verc:Receiver/cat_ru:Address"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="5" style="border:solid 1pt #000000;" valign="top">1.3. Транспорт:<br/>
				(№ вагона, автомашины, контейнера, рейса самолета, название судна)<br/>
                           <xsl:for-each select="verc:TransportInfo">
                              <xsl:if test="verc:TransportName">
                                 <xsl:value-of select="verc:TransportName"/>
                              </xsl:if>
                              <xsl:if test="verc:TransportNumber"> №<xsl:value-of select="verc:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000;" valign="top">1.6. Страна происхождения животных:<br/>
                           <xsl:if test="verc:ProductOrigin">
                              <xsl:value-of select="verc:ProductOrigin"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000;" valign="top">1.7. Страна, выдавшая сертификат:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:IssueCountry">
                              <xsl:value-of select="verc:RegistrationInfo/verc:IssueCountry"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000;" valign="top">1.8. Компетентное ведомство страны-экспортера:<br/>
                           <xsl:if test="verc:RegistrationInfo/verc:CompetentAuthority">
                              <xsl:value-of select="verc:RegistrationInfo/verc:CompetentAuthority"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.9. Учреждение страны-экспортера, выдавшее сертификат:<br/>
                           <xsl:value-of select="verc:RegistrationInfo/verc:TerritorialAuthority"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="2" style="border:solid 1pt #000000;" valign="top">1.4. Страна (ы) транзита:<br/>
                           <xsl:if test="verc:Route">
                              <xsl:value-of select="verc:Route"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000;" valign="top">1.10. Пункт пропуска товаров через таможенную границу:<br/>
                           <xsl:if test="verc:BorderOffice">
                              <xsl:value-of select="verc:BorderOffice"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="7" style="border:solid 1pt #000000;">2. Идентификация животных:<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">№<br/>п/п</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Вид животного</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Пол</td>
                        <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;">Порода</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;"> Возраст</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000;">Идентификационный номер</td>
                     </tr>
                     <xsl:for-each select="verc:ProductInfo">
                        <tr>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="position()"/>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:value-of select="verc:ProductName"/>
                           </td>
                           <td class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Sex">
                                 <xsl:value-of select="verc:Sex"/>
                              </xsl:if>
                           </td>
                           <td class="graph" colspan="2" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Breed">
                                 <xsl:value-of select="verc:Breed"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:Age">
                                 <xsl:value-of select="verc:Age"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;">
                              <xsl:if test="verc:IDNumber">
                                 <xsl:value-of select="verc:IDNumber"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <xsl:call-template name="Name4.1"/>
                     <xsl:call-template name="Name4.2"/>
                     <xsl:call-template name="Name4.3"/>
                     <xsl:call-template name="Name4.4"/>
                     <xsl:call-template name="Name"/>
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                     </tr>
                  </table>
                  <xsl:call-template name="End"/>
               </div>
            </xsl:when>
            <xsl:otherwise>
				<table width="100%">
					<tbody>
						<tr align="center">
							<td><font color="red" style="font-weight:bold">Тип формы неизвестен.</font><br/>Номер типа: <xsl:value-of select="$Type"/></td>
						</tr>
					</tbody>
				</table>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td/>
         </tr>
         <tr>
            <td/>
         </tr>
      </html>
   </xsl:template>
   <xsl:template name="Name4.1">
	   <xsl:if test="verc:NumberForm!='14' and verc:NumberForm!='30'">
		  <tr>
			 <td class="graph" colspan="100%" style="border:solid 1pt #000000;">При перевозке более 5 животных составляется опись животных, которая подписывается государственным/официальным ветеринарным врачом
			 страны-экспортера и является неотъемлемой частью данного сертификата.</td>
		  </tr>
		  <tr>
			 <td class="graph" colspan="100%" style="border:solid 1pt #000000;">3. Происхождение животных<br/>
			3.1. Место и время карантирования:
			<xsl:if test="verc:Quarantine/verc:PlaseQuarantine">
				   <xsl:value-of select="verc:Quarantine/verc:PlaseQuarantine"/>
				</xsl:if>
				<xsl:if test="verc:Quarantine/verc:NumberDays">, <xsl:value-of select="verc:Quarantine/verc:NumberDays"/>
				</xsl:if>
				<br/>3.2. Административно-территориальная единица страны-экспортера:
			<xsl:if test="verc:ExportTerrAuthority"> <xsl:value-of select="verc:ExportTerrAuthority"/>
				</xsl:if>
				<xsl:if test="verc:NumberForm='11'">
				   <br/>Срок пребывания лошадей на территории Таможенного союза - не более 90 дней.</xsl:if>
			 </td>
		  </tr>
       </xsl:if>
       <xsl:if test="verc:NumberForm='14' or verc:NumberForm='30'">
		  <tr>
			 <td class="graph" colspan="100%" style="border:solid 1pt #000000;">3. Происхождение продукции<br/>
			3.1. Название, адрес предприятия:
				<xsl:for-each select="verc:Manufacturer">
					<xsl:if test="cat_ru:OrganizationName">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</xsl:if>
					<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
						<xsl:value-of select="cat_ru:ShortName"/>
					</xsl:if>
					<xsl:for-each select="cat_ru:Address">
						<xsl:call-template name="Address"/>
					</xsl:for-each>
				</xsl:for-each>
				<br/>3.2. Административно-территориальная единица:
			<xsl:if test="verc:ExportTerrAuthority"> <xsl:value-of select="verc:ExportTerrAuthority"/>
				</xsl:if>
				<xsl:if test="verc:NumberForm='11'">
				   <br/>Срок пребывания лошадей на территории Таможенного союза - не более 90 дней.</xsl:if>
			 </td>
		  </tr>
       </xsl:if>
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">4. Информация о состоянии здоровья<br/>
		Я, нижеподписавшийся государственный/официальный ветеринарный врач, настоящим удостоверяю следующее:<br/>
            <xsl:if test="verc:NumberForm='11'">
		4.1. Экспортируемые на таможенную территорию Таможенного союза Республики  Беларусь, Республики Казахстан и Российской Федерации здоровые лошади не  вакцинированы против инфекционных энцефаломиелитов всех типов, африканской чумы лошадей и происходят с территорий страны-экспортера, свободных от заразных болезней животных:<br/>                        
  инфекционных энцефаломиелитов лошадей всех типов - содержались под наблюдением в течение последних 3 месяцев на территории хозяйства;       
  <br/>   африканской чумы лошадей - в течение последних 12 месяцев на территории  страны или административной территории в соответствии с регионализацией  либо  содержались в течение последних 40 дней на территории такой страны или административной территории в соответствии с регионализацией;                                                         
  <br/>   сапа – в течение последних 3 лет на территории страны или административной территории в соответствии с регионализацией;            
  <br/>   случной болезни (Trypanosoma  equiperdum)- в течение последних 6 месяцев на  территории  страны, в день отправки не было клинических признаков;                                                               
  <br/>   гриппа лошадей - при отсутствии клинических случаев в течение последних 21 дня на территории хозяйства;
  <br/>   ринопневмонии лошадей (герпесвирусной инфекции типа 1 лошадей в абортивной или паралитической форме) - в течение последних 21 дня на территории хозяйства;                                                    
  <br/>   вирусного артериита - на территории страны в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                   
  <br/>   инфекционной анемии - в  течение последних 3 месяцев на территории хозяйства;                                                              
  <br/>   инфекционного метрита лошадей - в соответствии с  рекомендациями Кодекса здоровья наземных животных МЭБ;                                  
  <br/>   сибирской язвы - в течение последних 20 дней на территории хозяйства.</xsl:if>
			<xsl:if test="verc:NumberForm='14'">
   4.1.  Экспортируемые на таможенную территорию Таможенного союза Республики  Беларусь, Республики Казахстан и Российской Федерации клинически здоровые суточные цыплята, индюшата, утята, гусята, страусята и инкубационные яйца этих видов птиц происходят с территорий страны-экспортера, свободных от заразных болезней животных:
   <br/>  - гриппа птиц, подлежащиего в соответствии с Кодексом здоровья наземных животных МЭБ обязательной декларации, в течение последних 12 месяцев на территории страны или административной территории или в течение 3 месяцев при проведении "стэмпинг аут" и отрицательных результатах эпизоотического контроля в соответствии с регионализацией;
   <br/>  - болезни Ньюкасла - в течение 12 месяцев на территории страны или административной территории или в течение 3 месяцев при проведении "стэмпинг аут" и отрицательных результатах эпизоотического контроля в соответствии с регионализацией.
   <br/>  Однодневные цыплята и инкубационные яйца поставлялись из предприятий и инкубаторов, которые имеют программы по контролю и надзору за сальмонеллой и которые имеют статус свободных от тифоза птиц (Salmonella gallinarum) и пуллороза (Salmonella pullorum).
   <br/>  Куриные и индюшиные хозяйства расположены на территориях, свободных от инфекционного бронхита кур, инфекционного ларинготрахеита, болезни Гамборо в течение последних 6 месяцев на территории хозяйства;
   <br/>  Страусиные хозяйства расположены на территориях, свободных от оспы птиц, туберкулеза птиц, пастереллеза, парамиксовирусных инфекций, инфекционного гидроперикардита в течение последних 6 месяцев на территории хозяйства. 
			</xsl:if>
            <xsl:if test="verc:NumberForm='16'">
  4.1.  Экспортируемые на таможенную территорию Таможенного союза Республики  Беларусь, Республики Казахстан и Российской Федерации клинически здоровые дикие животные(млекопитающие, птицы, рыбы,
земноводные,  пресмыкающиеся)  происходят  с  территорий  или  акваторий, свободных от заразных болезней животных:                                
<br/>   для животных всех видов (кроме птиц):                                
  <br/>   - ящура - в течение последних 12 месяцев на территории страны или административной территории в соответствии с регионализацией;            
  <br/>   - чумы крупного рогатого скота - в течение последних 24 месяцев на территории страны или административной территории в соответствии срегионализацией;                                                         
  <br/>   - африканской чумы свиней  -  в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
   <br/>   - блутанга - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;            
   <br/>   - лептоспироза - в течение последних 3 месяцев на территории хозяйства;                                                               
   <br/>   - сибирской язвы - в течение последних 20 дней на территории хозяйства;                                                               
   <br/>   - бешенства - в течение последних 6 месяцев на территории хозяйства; 
   <br/>   - вирусной геморрагической лихорадки - в течение последних 6 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
   <br/>   для крупных парнокопытных (зубров, буйволов, антилоп, бизонов, оленей и др.):                                                                  
   <br/>   - губкообразной энцефалопатии крупного рогатого скота и  скрепи  овец - на территории страны или административной территории в  соответствии  с регионализацией с незначительным или контролируемым риском по указанной болезни в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                                                            
   <br/>   -  заразного узелкового дерматита (бугорчатки) крупного рогатого скота  -  в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  лихорадки долины Рифт  -  в  течение последни  48 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - чумы мелких жвачных - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией; 
    <br/>   - эпизоотической геморрагической болезни оленей, болезни Акабане, везикулярного стоматита, контагиозной плевропневмонии  -   в  течение последних 24 месяцев на территории страны или   административной территории в соответствии с регионализацией;                             
    <br/>   - болезни Ауески (псевдобешенства) - в течение последних 12 месяцев на территории хозяйства;                                                 
    <br/>   - бруцеллеза, туберкулеза, паратуберкулеза - в  течение  последних  6 месяцев на территории хозяйства;                                         
    <br/>   - энзоотического лейкоза, вирусной диареи - в  течение последних 12 месяцев на территории хозяйства;                                         
    <br/>   для мелких парнокопытных (коз, архаров, ланей, туров, муфлонов, козерогов, косулей и др.):                                               
    <br/>   - лихорадки  долины Рифт - в  течение  последних  48 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - чумы мелких жвачных - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией; 
   <br/>   -  эпизоотической геморрагической болезни оленей   -   в течение последних 36 месяцев на  территории страны или административной территории в соответствии с регионализацией;                             
    <br/>   - чумы крупного рогатого скота - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - КУ-лихорадки - в течение последних 12 месяцев на территории  страны или административной территории в соответствии с регионализацией;        
    <br/>   - меди-висны, аденоматоза, артрита-энцефалита, пограничной болезни  - в течение последних 36 месяцев на территории страны или  административной территории в соответствии с регионализацией;                             
    <br/>   - паратуберкулеза  -  в течение последних 6 месяцев на территории хозяйства;                                                               
    <br/>   - скрепи овец - в течение последних 7 лет на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  туберкулеза, бруцеллеза  -  в  течение последних 6 месяцев на территории хозяйства;                                                    
    <br/>   - оспы овец и коз - в течение последних 12 месяцев на территории страны или административной территории в соответствии с регионализацией; 
    <br/>   для  однокопытных  (зебр, куланов, лошадей  Пржевальского, киангов и др.):                                                                  
    <br/>   - чумы лошадей - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;        
    <br/>   - инфекционного энцефаломиелита всех видов - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                                          
    <br/>   - вирусного  артериита  -  на  территории страны в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                   
    <br/>   - сапа - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  случной болезни (Trypanosoma  equiperdum), сурры (Trypanosoma evansi), пироплазмоза (Babesia caballi), нутталиоза (Nuttallia  equi) - в течение последних 12 месяцев на административной   территории в соответствии с регионализацией;                                          
    <br/>   - инфекционного метрита лошадей -  в течение последних 12 месяцев на территории хозяйства;                                                    
    <br/>   для диких свиней разных видов:                                       
    <br/>   - африканской чумы свиней  -  в  течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - классической чумы свиней  -  в течение последних 12 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - везикулярной болезни свиней, везикулярного стоматита  -  в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                             
   <br/>   - болезни Ауески (псевдобешенства) - в течение последних 12 месяцев на административной территории в соответствии с регионализацией или на территории хозяйства;                                                    
    <br/>   - энтеровирусного энцефаломиелита свиней (болезни Тешена, тексовирусного энцефаломиелита свиней) - в течение  последних  6  месяцев на территории хозяйства;                                                 
    <br/>   - репродуктивно-респираторного синдрома свиней - в  течение последних 6 месяцев на территории хозяйства;                                       
    <br/>   для плотоядных разных видов:                                         
    <br/>   - чумы плотоядных, вирусного энтерита, токсоплазмоза, инфекционного гепатита - в течение последних 12 месяцев на территории хозяйства;       
    <br/>   - туляремии - в течение последних 24 месяцев на территории хозяйства;
    <br/>   для птиц всех видов:                                                 
    <br/>   - болезни  Держи, чумы уток, вирусного  гепатита утят (для водоплавающей птицы)  - в  течение последних 6 месяцев на территории хозяйства;                                                               
    <br/>   -  гриппа птиц, подлежащего в соответствии с Кодексом  здоровья наземных животных МЭБ обязательной декларации, - в  течение  последних  6 месяцев на административной территории в соответствии с регионализацией; 
    <br/>   - орнитоза (пситтакоза), инфекционного бронхита, оспы, реовирусной инфекции и ринотрахеита индеек  -  в течение последних 6 месяцев на территории хозяйства;                                                    
    <br/>   -  болезни  Ньюкасла  -   в течение последних 12 месяцев на административной территории в соответствии с регионализацией или на территории хозяйства;                                                    
    <br/>   для грызунов разных видов;                                           
    <br/>   -  лихорадки  долины  Рифт  -  в течение последних 48 месяцев на территории страны;                                                       
   <br/>    -  туляремии  -  в  течение последних 24 месяцев на территории хозяйства;                                                               
    <br/>   - болезни Ауески (псевдобешенства) - в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                                  
    <br/>   -   миксоматоза, вирусной геморрагической болезни кроликов, лимфоцитарного  хориоменингита  -  в течение последних 6 месяцев на территории хозяйства;                                                    
   <br/>   -  токсоплазмоза - в течение последних 12 месяцев на территории хозяйства;                                                               
    <br/>   для ластоногих и китообразных разных видов:                          
   <br/>    - чумы тюленей (морбилливирусной инфекции), везикулярной экзантемы - в течение последних 36 месяцев в местах их обитания (происхождения);     
    <br/>   для слонов, жирафов, окапи, гиппопотамов, носорогов, тапиров, неполнозубых и трубкозубых, насекомоядных, сумчатых, летучих мышей, енотовидных, куньих, виверовых и других экзотических животных разных видов:                                                                   
    <br/>   -  лихорадки долины Рифт  -  в течение последних 48 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - венесуэльского энцефаломиелита - в течение последних 24 месяцев  на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   -  заразного узелкового дерматита (бугорчатки) крупного рогатого скота  -  в  течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  африканской чумы лошадей, болезни Ауески (псевдобешенства), трансмиссивного энцефаломиелита норок, лимфоцитарного хориоменингита -  в течение последних 12 месяцев на территории  страны или административной территории в соответствии с регионализацией;                             
    <br/>   -  туляремии  -  в  течение последних 24 месяцев на территории хозяйства;                                                               
    <br/>   для приматов разных видов:                                           
    <br/>   - лихорадки долины Рифт, туляремии - в течение последних 6 месяцев на территории хозяйства;                                                    
    <br/>   - геморрагической лихорадки (Ласса, Эбола, Марбург, Денге, желтой лихорадки, лихорадки Западного  Нила), оспы обезьян  -  при отсутствии зарегистрированных случаев на территории хозяйства  или  административной территории, из которых экспортируются приматы.</xsl:if>
			<xsl:if test="verc:NumberForm='30'">
				Сертификат выдан на основе следующих доэкспортных сертификатов (при наличии более 2 доэкспортных сертификатов прилагается список):
				<table width="100%" class="items">
					<tbody>
						<tr>
							<td>Дата</td>
							<td>Номер</td>
							<td>Страна<br/>происхождения</td>
							<td>Административная<br/>территория</td>
							<td>Регистрационный номер<br/>предприятия</td>
							<td>Вид и количество<br/>(вес нетто) товара</td>
						</tr>
					</tbody>
				</table>
				4.1. Экспортируемые на  таможенную  территорию Евразийского  экономического  союза натуральный  мед  и  продукты пчеловодства получены из хозяйств (пасек) и административных территорий в соответствии с регионализацией, свободных от американского гнильца, европейского гнильца, нозематоза в течение последних 3 месяцев на территории хозяйства.
			</xsl:if>
            <xsl:if test="verc:NumberForm='41'">

 4.1. Экспортируемые на таможенную территорию Таможенного союза Республики  Беларусь, Республики Казахстан и Российской Федерации клинически здоровы  зоопарковые и цирковые животные любого биологического вида происходят с территорий или акватории, свободных от заразных болезней животных:                                              
    <br/>   для животных всех видов (кроме птиц):                                
    <br/>   - ящура - в течение последних 12  месяцев на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   - чумы крупного рогатого скота - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией:                                                         
    <br/>   - африканской чумы свиней  -  в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
   <br/>    - блутанга - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  лептоспироза  -  в течение последних 3 месяцев на территории хозяйства;                                                               
    <br/>   - сибирской  язвы  -  в течение последних 20 дней на территории хозяйства;                                                               
    <br/>   - бешенства - в течение последних 6 месяцев на территории хозяйства; 
    <br/>   - вирусной геморрагической лихорадки - в течение последних 6 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   для крупных парнокопытных (крупного рогатого скота, зубров, буйволов, зебу, яков, антилоп, бизонов, оленей и др.):                             
    <br/>   - губкообразной энцефалопатии крупного рогатого скота и скрепи овец - на территории страны или административной территории в соответствии с регионализацией с незначительным или контролируемым риском по указанной болезни в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                                                            
    <br/>   -  заразного узелкового  дерматита  (бугорчатки) крупного рогатого скота  -  в течение последних 36 месяцев  на территории страны или административной территории в соответствии с регионализацией;            
   <br/>    - лихорадки долины Рифт  -  в течение последних 48 месяцев на территории  страны  или  административной  территории  в  соответствии  с регионализацией;                                                         
    <br/>   - чумы мелких жвачных - в течение последних 36 месяцев на  территории страны или административной территории в соответствии с регионализацией; 
    <br/>   - эпизоотической геморрагической болезни оленей, болезни Акабане, везикулярного стоматита, контагиозной плевропневмонии  -   в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                             
    <br/>   - болезни Ауески (псевдобешенства) - в течение последних 12 месяцев на территории хозяйства;                                                
    <br/>   - бруцеллеза, туберкулеза, паратуберкулеза - в течение последних 6 месяцев на территории хозяйства;                                         
    <br/>   - энзоотического  лейкоза,  вирусной диареи - в течение последних 12 месяцев на территории хозяйства;                                         
  <br/>   для мелких парнокопытных (овец, коз, архаров, ланей, туров, муфлонов, козерогов, косулей и др.):                                               
    <br/>   - лихорадки  долины Рифт  -  в  течение последних 48 месяцев на территории  страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - чумы  мелких жвачных - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией; 
    <br/>   - эпизоотической геморрагической болезни оленей - в течение последни 36  месяцев на территории страны или административной территории в соответствии с регионализацией;                                          
    <br/>   - чумы крупного рогатого скота -  в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - КУ-лихорадки - в течение последних 12 месяцев на территории страны или административной территории в соответствии с регионализацией;       
    <br/>   - меди-висны, аденоматоза, артрита-энцефалита, пограничной болезни - в течение последних 36 месяцев на территории страны или административной территории  в  соответствии с регионализацией;                           
    <br/>   - паратуберкулеза - в течение последних 6 месяцев на территории хозяйства;                                                               
    <br/>   - скрепи овец - в течение последних 7 лет на территории страны или административной территории в соответствии с регионализацией;            
    <br/>   -  туберкулеза, бруцеллеза  -  в течение последних  6 месяцев на территории хозяйства;                                                    
    <br/>   - оспы овец и коз - в течение последних 12 месяцев на территории страны или административной территории в соответствии с регионализацией; 
    <br/>   для  однокопытных  (ослов,  мулов, пони, зебр, куланов, лошадей Пржевальского, киангов и др., за исключением лошадей):                  
    <br/>   - чумы лошадей - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;        
    <br/>   - инфекционного энцефаломиелита всех видов - в течение  последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                                          
    <br/>   - вирусного  артериита  -  на территории страны в соответствии с рекомендациями Кодекса здоровья наземных животных МЭБ;                   
    <br/>   - сапа - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;            
   <br/>    -  случной  болезни  (Trypanosoma  equiperdum), сурры (Trypanosomaevansi), пироплазмоза (Babesia caballi), нутталиоза (Nuttallia  equi) - в  течение последних 12 месяцев на административной   территории в соответствии с регионализацией;                                          
    <br/>   - инфекционного метрита лошадей - в течение последних 12 месяцев на территории хозяйства;                                                    
    <br/>   для домашних и диких свиней разных видов:                            
    <br/>   -  африканской  чумы  свиней  -  в течение последних 36 месяцев  на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   -  классической чумы свиней  -  в течение последних 12 месяцев на территории  страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - везикулярной болезни  свиней,  везикулярного  стоматита - в течение последних 24 месяцев на территории страны или административной территории в соответствии с регионализацией;                             
    <br/>   - болезни  Ауески  (псевдобешенства) - в течение последних 12 месяцев на административной территории  в  соответствии  с регионализацией или на территории хозяйства;                                                    
    <br/>   - энтеровирусного энцефаломиелита свиней (болезни Тешена, тексовирусного энцефаюмиелита свиней) - в течение последних 6 месяцев  на территории хозяйства;                                                    
    <br/>   - репродуктивно-респираторного синдрома свиней - в  течение последних 6 месяцев на территории хозяйства;                                       
    <br/>   для плотоядных разных видов:                                         
    <br/>   - чумы плотоядных, вирусного  энтерита, токсоплазмоза, инфекционного гепатита - в течение последних 12 месяцев на территории хозяйства;       
    <br/>   - туляремии - в течение последних 6 месяцев  на территории хозяйства;
    <br/>   для птиц всех видов:                                                 
    <br/>   - чумы уток, вирусного гепатита утят (для водоплавающей  птицы)  -  в течение последних 6 месяцев на территории хозяйства;                     
    <br/>   -  гриппа  птиц,  подлежащего в соответствии с Кодексом здоровья наземных животных МЭБ обязательной декларации, - в течение последних 6 месяцев на административной территории в соответствии с регионализацией; 
    <br/>   - орнитоза (пситтакоза), инфекционного  бронхита, оспы, реовирусной инфекции и ринотрахеита  индеек  -  в  течение последних 6 месяцев на территории хозяйства;                                                    
    <br/>   -  болезни  Ньюкасла  -   в течение последних 12 месяцев на административной территории в соответствии с регионализацией или на территории хозяйства;                                                    
    <br/>   для грызунов разных видов:                                           
    <br/>   -  лихорадки долины Рифт  -  в  течение последних 48 месяцев на территории страны;                                                       
    <br/>   -  туляремии  -  в течение последних 24 месяцев на территории хозяйства;                                                               
    <br/>   - болезни Ауески (псевдобешенства) - в соответствии с  рекомендациями Кодекса здоровья наземных животных МЭБ;                                  
    <br/>   -   миксоматоза, вирусной  геморрагической  болезни кроликов, лимфоцитарного хориоменингита  -  в течение последних 6 месяцев на территории хозяйства;                                                    
    <br/>   - токсоплазмоза  -  в течение последних 12 месяцев на территории хозяйства;                                                              
   <br/>   для ластоногих и китообразных разных видов:                           
   <br/>   - чумы тюленей (морбилливирусной инфекции), везикулярной экзантемы  - в течение последних 36 месяцев в местах их обитания (происхождения);     │
    <br/>   для слонов, жирафов, окапи, гиппопотамов, носорогов, тапиров, неполнозубых и трубкозубых, насекомоядных, сумчатых, летучих мышей, енотовидных, куньих, виверовых  и  других  экзотических животных разных видов:                                                                   
    <br/>   - лихорадки долины Рифт  -  в  течение последних 48 месяцев на территории страны или административной территории в соответствии с регионализацией;                                                         
    <br/>   - венесуэльского энцефаломиелита - в течение последних 24  месяцев на территории  страны  или  административной  территории  в соответствии с регионализацией;                                                         
   <br/>    - заразного узелкового дерматита (бугорчатки) крупного рогатого скота - в течение последних 36 месяцев на территории страны или административной территории в соответствии с регионализацией;            
   <br/>    - африканской чумы лошадей, болезни Ауески (псевдобешенства), трансмиссивного энцефаломиелита норок, лимфоцитарного хориоменингита -  в течение последних 12 месяцев на территории  страны  или  административной территории в соответствии с регионализацией;                             
    <br/>   - туляремии - в течение последних 6 месяцев на территории  хозяйства;
    <br/>   для приматов разных видов:                                           
    <br/>   - лихорадки долины Рифт, туляремии - в течение  последних  6  месяцев на территории хозяйства;                                                 
    <br/>   - геморрагической лихорадки (Ласса, Эбола, Марбург, Денге, желтой лихорадки, лихорадки Западного Нила), оспы обезьян - при  отсутствии зарегистрированных случаев на территории хозяйства или административной территории, из которых экспортируются приматы. </xsl:if>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Name4.2">
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
            <xsl:if test="verc:NumberForm='11'">
		4.2. Экспортируемые на таможенную территорию Таможенного союза Республики Беларусь, Республики Казахстан и Российской Федерации животные исследованы с отрицательным  результатом на (указать  название
		 лаборатории, дату и метод исследования):<br/>
		   сап 
        <br/>   случную болезнь (Trypanosoma equiperdum) 
        <br/>   инфекционную анемию<br/>
               <xsl:for-each select="verc:ResearchLaboratory">
                  <xsl:value-of select="verc:NameLaboratory"/> 
		 <xsl:if test="verc:DateExamination">Дата:
		 <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateExamination"/>
                     </xsl:call-template> 
		 </xsl:if>
                  <xsl:if test="verc:MethodExamination">Метод исследования: <xsl:value-of select="verc:MethodExamination"/>
                  </xsl:if>
                  <xsl:if test="position()!=last()">
                     <br/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
            <xsl:if test="verc:NumberForm='14'">
		4.2. Родительское стадо кур и индеек исследовано серологически пуроллозным антигеном с отрицательным результатом.
            </xsl:if>
            <xsl:if test="verc:NumberForm='16'">
        4.2. Животные не менее 30  дней  содержались на карантинных базах под наблюдением государственного/официального ветеринарного врача и не  имели контакта с другими животными. Во время карантина  проводился  поголовный клинический осмотр с обязательной термометрией. В этот период проводились диагностические исследования:                                
    <br/>   - крупных парнокопытных - на бруцеллез, туберкулез, паратуберкулез, энзоотический лейкоз, блутанг;                                           
   <br/>   - мелких парнокопытных - на бруцеллез, паратуберкулез, блутанг;      
   <br/>   -  однокопытных  -  на сап, случную болезнь, сурру, пироплазмоз, нутталиоз, ринопневмонию, инфекционный метрит, инфекционную анемию, вирусный артериит;                                                       
    <br/>   - норок - на алеутскую болезнь;                                      
    <br/>   - птиц - на орнитоз (пситтакоз), грипп птиц;                         
    <br/>   - приматов  -  на наличие антител к возбудителям геморрагической лихорадки (Ласса, Эбола, Марбург, Денге, желтой лихорадки, лихорадки Западного Нила), ВИЧ-инфекции,  лимфатического хориоменингита,  гепатита типа A, B, C, оспы обезьян, герпеса B, на наличие возбудителей группы энтеробактерий (эшерихий, сальмонелл, шигелл, кампилобактерий, лепры, риккетсиозы, боррелиозы), на туберкулез.     
        </xsl:if>
        <xsl:if test="verc:NumberForm='30'">
			4.2. Мед и продукты пчеловодства не содержат остатков хлорамфеникола, хлорфармазина, колхицина, дапсона, диметридазона, нитрофуранов, ронидазола. Содержание кумафоса - не более 100 мкг/кг, амитраза - не более 200 мкг/кг.
        </xsl:if>
            <xsl:if test="verc:NumberForm='41'">
        4.2. Животные не менее 21 дня содержались на карантинных базах под наблюдением государственного/официального ветеринарного врача и не имели контакта с другими животными. Во время карантина проводился  поголовный клинический осмотр с обязательной термометрией. В этот период проводились диагностические исследования:                                
    <br/>   - крупных  парнокопытных  - на бруцеллез, туберкулез, паратуберкулез, энзоотический лейкоз, блутанг;                                           
    <br/>   - мелких парнокопытных - на бруцеллез, паратуберкулез, блутанг;      
    <br/>   -  однокопытных  -  на  сап,  случную  болезнь, сурру, пироплазмоз, нутталиоз, ринопневмонию, инфекционный метрит, инфекционную анемию, вирусный артериит;                                                       
    <br/>   - норок - на алеутскую болезнь;                                      
    <br/>   - птиц - на орнитоз (пситтакоз), грипп птиц;                         
    <br/>   - приматов - на туберкулез.</xsl:if>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Name4.3">
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
            <xsl:if test="verc:NumberForm='11'">
			4.3. Животные вакцинированы против гриппа лошадей вакциной,соответствующей стандартам, указанным в Руководстве по диагностическим тестам и
			 вакцинам для наземных животных МЭБ, в период между 21-м и 90-м днем до отправки первично или повторно.  
			</xsl:if>
			<xsl:if test="verc:NumberForm='14'">
			4.3. Суточные цыплята привиты против болезни Марека.
			</xsl:if>
            <xsl:if test="verc:NumberForm='16'">
			4.3. Не  позднее чем за 20 дней до отправки животные  вакцинированы, если они не были вакцинированы в течение последних 12 месяцев:           
                <br/>   - все плотоядные - против бешенства;                                 
                <br/>   - собаки, лисицы, песцы, волки,  шакалы  -  против чумы плотоядных, вирусного энтерита, гепатита, лептоспироза;                              
                <br/>   - норки, хорьки - против вирусного энтерита;                         
                <br/>   - нутрии - против пастереллеза;                                      
                <br/>   -  кошачьи  -  против панлейкопении, вирусного ринотрахеита и калицивироза;                                                            
                <br/>   - грызуны (кролики) - против миксоматоза и вирусной геморрагической болезни кроликов;                                                        
                <br/>   - птицы (отряда куриных) - против болезни Ньюкасла. 
             </xsl:if>
            <xsl:if test="verc:NumberForm='30'">
				4.3. Мед и продукты пчеловодства, экспортируемые на таможенную территорию Евразийского экономического союза:
				<br/>   - не имеют измененных органолептических, физико
				<br/>   - химических показателей;
				<br/>   - не содержат натуральных или синтетических эстрогенных гормональных веществ, тиреостатических препаратов;
				<br/>   - не имеют нарушений целостности упаковки;
				<br/>   - не содержат остатков лекарственных препаратов, которые применялись для лечения и обработки пчел.
            </xsl:if>
            <xsl:if test="verc:NumberForm='41'">
                4.3. Не позднее чем за 20 дней  до  отправки  животные вакцинированы, если они не были вакцинированы в течение последних 12 месяцев:           
                <br/>   - все плотоядные - против бешенства;                                 
                <br/>   -  собаки, лисицы, песцы, волки, шакалы - против чумы плотоядных, вирусного энтерита, гепатита, лептоспироза;                              
                <br/>   - норки, хорьки - против вирусного энтерита, чумы плотоядных;        
                <br/>   - нутрии - против пастереллеза;                                      
                <br/>   - кошачьи - против бешенства, панлейкопении, калицивироза и вирусного ринотрахеита;                                                            
                <br/>   - грызуны (кролики)  -  против миксоматоза и вирусной геморрагической болезни;                                                                 
                <br/>   - птицы (отряда куриных) - против болезни Ньюкасла.</xsl:if>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Name4.4">
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
            <xsl:if test="verc:NumberForm='11'">
		4.4. Перед отправкой животные подвергнуты ветеринарной обработке (заполняется в случае проведения обработки с указанием метода и даты обработки):<u>
                  <xsl:for-each select="verc:Immunization">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
                  <xsl:for-each select="verc:ProcessingParasites">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
               </u>
            </xsl:if>
            <xsl:if test="verc:NumberForm='14'">
		4.4. Инкубационные яйца получены от птицы, удовлетворящим ветеринарные требования, указанные выше.
            </xsl:if>
            <xsl:if test="verc:NumberForm='16'">
		4.4. Перед отправкой животные подвергнуты ветеринарным обработкам (указать метод, дату обработки):<u>
                  <xsl:for-each select="verc:Immunization">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
                  <xsl:for-each select="verc:ProcessingParasites">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
               </u>
            </xsl:if>
            <xsl:if test="verc:NumberForm='30'">
				4.4. В ходе сбора меда и производства продуктов пчеловодства использовались следующие пестициды:
            </xsl:if>
            <xsl:if test="verc:NumberForm='41'">   
		4.4. Цирковые животные, регулярно перевозимые для участия в гастролях, содержатся под контролем государственной (ведомственной) ветеринарной службы и подвергаются 1 раз в год диагностическим
		исследованиям:                                                           
            <br/>   - крупные парнокопытные - на бруцеллез, туберкулез, паратуберкулез, энзоотический лейкоз, блутанг;                                           
            <br/>   - мелкие парнокопытные - на бруцеллез, паратуберкулез, блутанг;      
            <br/>   - однокопытные - на сап, случную болезнь, инфекционную анемию;       
            <br/>   - верблюжьи - на блутанг, сап, сурру, туберкулез, бруцеллез;         
            <br/>   - норки - на алеутскую болезнь;                                      
            <br/>   - кошачьи - на дерматофитозы (методом люминесцентной диагностики);   
            <br/>   - птицы - на орнитоз (пситтакоз), грипп птиц, сальмонеллез;         
            <br/>   - приматы - на туберкулез.</xsl:if>
         </td>
      </tr>
      <xsl:if test="verc:NumberForm='41'">
         <tr>
            <td class="graph" colspan="100%" style="border:solid 1pt #000000;">4.5. Перед отправкой животные подвергнуты ветеринарным обработкам (указать метод, дату обработки):<u>
                  <xsl:for-each select="verc:Immunization">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
                  <xsl:for-each select="verc:ProcessingParasites">
                     <xsl:value-of select="verc:NameProcessing"/> 
		<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="verc:DateProcessing"/>
                     </xsl:call-template> 
		</xsl:for-each>
               </u>
            </td>
         </tr>
      </xsl:if>
   </xsl:template>
   <xsl:template name="Name">
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
            <xsl:if test="verc:NumberForm='11' or verc:NumberForm='16'">
		4.5. Экспортируемые на таможенную территорию Таможенного союза Республики Беларусь, Республики Казахстан и Российской Федерации животные идентифицированы.</xsl:if>
			<xsl:if test="verc:NumberForm='14'">
		4.5. Инкубационные яйца продезинфицированы.</xsl:if>
		<xsl:if test="verc:NumberForm='30'">
			4.5. Химико-токсикологические (тяжелые  металлы,  пестициды), радиологические и  другие  показатели  меда  и  продуктов пчеловодства соответствуют действующим на таможенной территории Евразийского экономического союза ветеринарным и санитарным нормам и правилам.		</xsl:if>
            <xsl:if test="verc:NumberForm='41'">
		4.6. Экспортируемые на таможенную территорию Таможенного союза Республики Беларусь, Республики Казахстан и Российской Федерации животные идентифицированы.</xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
            <xsl:if test="verc:NumberForm='11' or verc:NumberForm='16'">
		4.6. Транспортное средство обработано и подготовлено в соответствии с правилами, принятыми в стране-экспортере.</xsl:if>
			<xsl:if test="verc:NumberForm='14'">
		4.6. Инкубационные яйца и циплята поставляются в одноразовой таре.</xsl:if>
		<xsl:if test="verc:NumberForm='30'">
			4.6. Мед и продукты пчеловодства признаны пригодными для употребления в пищу.
		</xsl:if>
            <xsl:if test="verc:NumberForm='41'">
		4.7. Транспортное средство обработано и подготовлено в соответствии с правилами, принятыми в стране-экспортере.</xsl:if>
         </td>
      </tr>
      <xsl:if test="verc:NumberForm='14' or verc:NumberForm='16' or verc:NumberForm='30' or verc:NumberForm='41'">
         <tr>
            <td class="graph" colspan="100%" style="border:solid 1pt #000000;">
				<xsl:if test="verc:NumberForm='14'">
		4.7. Транспортное средство обработано и подготовлено в соответствии с правилами, принятыми в стране-эспортере.</xsl:if>
               <xsl:if test="verc:NumberForm='16'">
		4.7. Маршрут следования прилагается.</xsl:if>
		<xsl:if test="verc:NumberForm='30'">
			4.7. Тара и упаковочный материал одноразовые и соответствуют требованиям Евразийского экономического союза.
		</xsl:if>
               <xsl:if test="verc:NumberForm='41'">
		4.8. Маршрут следования прилагается.</xsl:if>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="verc:NumberForm='30'">
		  <tr>
				<td class="graph" colspan="100%" style="border:solid 1pt #000000;">
					4.8. Транспортное средство обработано и подготовлено в соответствии с правилами, принятыми в стране-экспортере.
				</td>
			</tr>
      </xsl:if>
   </xsl:template>
   <xsl:template name="End">
      <table width="100%">
         <tr>
            <td class="graph" style="border:solid 0pt" width="10%">Место</td>
            <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" width="45%">
               <xsl:if test="verc:Location/verc:PlaceLocation">
                  <xsl:value-of select="verc:Location/verc:PlaceLocation"/> </xsl:if>
               <xsl:for-each select="verc:Location/verc:Address">
                  <xsl:call-template name="Address"/>
               </xsl:for-each>
            </td>
            <td class="graph" style="border:solid 0pt" width="5%"> </td>
            <td class="graph" style="border:solid 0pt" width="6%">Дата</td>
            <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" width="15%">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="verc:DateCertf"/>
               </xsl:call-template>
            </td>
            <td class="graph" style="border:solid 0pt" width="5%"> </td>
            <td align="center" class="graph" style="border:solid 0pt">Печать</td>
         </tr>
         <tr>
            <td class="graph" colspan="3" style="border:solid 0pt">Подпись государственного/официального ветеринарного врача</td>
            <td class="graph" colspan="4" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;"> </td>
         </tr>
         <tr>
            <td class="graph" colspan="7" style="border:solid 0pt">Ф.И.О. и должность 
				<u>
                  <xsl:value-of select="verc:PersonSignature/cat_ru:PersonSurname"/> 
				<xsl:value-of select="verc:PersonSignature/cat_ru:PersonName"/>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonMiddleName"> <xsl:value-of select="verc:PersonSignature/cat_ru:PersonMiddleName"/>
                  </xsl:if>
                  <xsl:if test="verc:PersonSignature/cat_ru:PersonPost">, <xsl:value-of select="verc:PersonSignature/cat_ru:PersonPost"/>
                  </xsl:if>
               </u>
            </td>
         </tr>
      </table>
   </xsl:template>
</xsl:stylesheet>
