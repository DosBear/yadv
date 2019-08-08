<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru qcer catSert_ru" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:qcer="urn:customs.ru:Information:SertifDocuments:QuarantineCertificate:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="qcer:QuarantineCertificate">
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
                        border: solid 1pt #000000;
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
                    </style>
         <table style="width:170mm">
            <tr>
               <td align="center" class="graph12" colspan="3">МИНСЕЛЬХОЗПРОД РОССИИ РОСГОСКАРАНТИН</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="3">ГОСУДАРСТВЕННАЯ ИНСПЕКЦИЯ ПО КАРАНТИНУ РАСТЕНИЙ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
            </tr>
            <tr>
               <td align="center" class="graph10" colspan="3">
					по <xsl:value-of select="qcer:RegionManagement"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="3">(республике, краю, области, городу - субъекту Российской Федерации)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">Адрес:  
					<xsl:apply-templates select="qcer:SubjectInfo"/>
					<!--xsl:for-each select="qcer:SubjectInfo/catSert_ru:LegalAddress">
                     <xsl:apply-templates select="."/>, 
					</xsl:for-each>
					Телефон 	
					<xsl:for-each select="qcer:SubjectInfo/catSert_ru:Phone">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each-->	
               </td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="3">Карантинный сертификат №  
					<xsl:value-of select="qcer:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Дата выдачи: 
					<xsl:for-each select="qcer:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
               <td class="graph10" colspan="2">Действителен для отправки по: 
					<xsl:for-each select="qcer:ExpirationDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
			<td class="graph10" colspan="3">1. Выдан:  
				<xsl:apply-templates select="qcer:DeclarantInfo"/>
					<!--xsl:value-of select="qcer:DeclarantInfo/cat_ru:OrganizationName"/> 
					<xsl:for-each select="qcer:DeclarantInfo/catSert_ru:LegalAddress">
						<xsl:text>, </xsl:text>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
					<xsl:for-each select="qcer:DeclarantInfo/catSert_ru:Phone">
						<xsl:text>, </xsl:text>
						<xsl:value-of select="."/>
					</xsl:for-each-->
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="3">(отправитель, его адрес, телефон)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">на вывоз в
					<xsl:apply-templates select="qcer:ReceiverInfo"/>
					<!--xsl:value-of select="qcer:ReceiverInfo/cat_ru:OrganizationName"/> 
					<xsl:for-each select="qcer:ReceiverInfo/catSert_ru:LegalAddress">
						<xsl:text>, </xsl:text>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
 					<xsl:for-each select="qcer:ReceiverInfo/catSert_ru:Phone">
						<xsl:text>, </xsl:text>
						<xsl:value-of select="."/>
					</xsl:for-each-->
              </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="3">(название региона, пункта выгрузки, хранения; получатель, его адрес, телефон)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">следующей подкарантинной продукции (груза, материала):  
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:GoodsName"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">2. Происхождение  
					<xsl:for-each select="qcer:Goods">
                     <xsl:for-each select="qcer:Origin">
                        <xsl:call-template name="Address"/>
 						<xsl:text> </xsl:text>
                    </xsl:for-each>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="3">(страна, регион, место заготовки, производства)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">3. Общий вес (тонн, кг),   
					<xsl:for-each select="qcer:Goods">
						 <xsl:value-of select="qcer:TotalWeigh"/> 
						<xsl:value-of select="qcer:MeasureUnitWeigh"/> 
					</xsl:for-each>
					объем (куб. м) 
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:Volume"/> 
					<xsl:value-of select="qcer:MeasureUnitVolume"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">4. Количество мест (штук) 
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:PackagesQuantity"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">5. Маркировка (отличительные признаки)  
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:Mark"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">6. Способ транспортировки 
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:MethodTransportation"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">7. Станция (пункт) отправления  
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:SenderStation"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">8. Станция (пункт) назначения  
					<xsl:for-each select="qcer:Goods">
                     <xsl:value-of select="qcer:RecipientStation"/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">9.  Сведения  о  карантинном  фитосанитарном  состоянии  продукции
(груза, материала), месте заготовки и проведенных мероприятиях 
<xsl:for-each select="qcer:StatusGoodsInfo">
                     <xsl:value-of select="."/> 
</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">10.   Устанавливаются    следующие   карантинные    фитосанитарные
мероприятия   и   условия   при   отправке,  хранении,  получении, реализации   и   использовании подкарантинной  продукции  (груза, материала) 
<xsl:for-each select="qcer:AdditionalActivities">
                     <xsl:value-of select="."/> 
</xsl:for-each>
                  <xsl:for-each select="qcer:AddressSearch">
                     <xsl:call-template name="Address"/>
					 <xsl:if test="qcer:Phone">, <xsl:value-of select="qcer:Phone"/></xsl:if>
                  </xsl:for-each> 
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">В   течение   3   дней   по   прибытии   в  пункт   назначения
подкарантинная  продукция  (груз,  материал) подлежит предъявлению
органам Госинспекции по карантину растений в пункте назначения для
карантинного  фитосанитарного досмотра. Использование и реализация
продукции  (груза,  материала)  без  досмотра  и акта карантинного
фитосанитарного контроля запрещается.</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">11. Выдан на сновании
					<xsl:for-each select="qcer:AuthorityCertificate">
                     <xsl:value-of select="cat_ru:PrDocumentName"/> 
					<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
					<xsl:for-each select="cat_ru:PrDocumentDate">
                        <xsl:call-template name="Date"/> 
					</xsl:for-each>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="3">(наименования и номера документов)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="3">
                  <br>Печать Госинспекции </br>
                  <br>(пункта)</br>
               </td>
            </tr>
            <tr>
               <td class="graph10">Государственный инспектор</td>
               <td align="center" class="graph10">_____________________</td>
               <td align="center" class="graph10">
                  <xsl:value-of select="qcer:InspectorSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="qcer:InspectorSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="qcer:InspectorSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">по карантину растений</td>
               <td align="center" class="graph8">(подпись)</td>
               <td align="center" class="graph8">(инициалы, фамилия госинспектора)</td>
            </tr>
         </table>
      </html>
   </xsl:template>
   <xsl:template match="catSert_ru:LegalAddress| catSert_ru:FactAddress">
 		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<!-- xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if-->
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	  </xsl:template>
   <xsl:template match="qcer:ReceiverInfo|qcer:DeclarantInfo|qcer:SubjectInfo">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <br/>
	  <xsl:if test="catSert_ru:OKPOID">Код организации по ОКПО:
			<xsl:value-of select="catSert_ru:OKPOID"/>
		  <br/>
	  </xsl:if>
	  <xsl:if test="catSert_ru:LegalAddress">Юридический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:LegalAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:FactAddress">Фактический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:FactAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:Phone">Тел.: 
		<xsl:for-each select="catSert_ru:Phone">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Fax">Факс: 
		<xsl:for-each select="catSert_ru:Fax">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Email">Email: 
		<xsl:for-each select="catSert_ru:Email">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
   </xsl:template>
  </xsl:stylesheet>
