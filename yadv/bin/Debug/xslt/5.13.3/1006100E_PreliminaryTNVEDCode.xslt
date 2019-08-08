<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru tnved" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tnved="urn:customs.ru:Information:CustomsDocuments:PreliminaryTNVEDCode:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tnved:PreliminaryTNVEDCode">
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

                       td {border: 1px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                     table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    
                    </style>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center" class="graph12" colspan="2">
                  <br/>Предварительное решение по классификации товара<br/><br/>
               </td>
            </tr>
            <tr>
               <td class="graph10" style="width:85mm">1. Наименование таможенного органа, принявшего предварительное решение  
				<xsl:value-of select="tnved:Customs/cat_ru:OfficeName"/>
               </td>
               <td class="graph10" style="width:85mm">2. Заявитель 
				<xsl:value-of select="tnved:Declarant/cat_ru:OrganizationName"/> 
				<xsl:for-each select="tnved:Declarant/cat_ru:Address">
                     <xsl:call-template name="Address"/> 
				</xsl:for-each>
                  <xsl:value-of select="tnved:Declarant/tnved:Chief/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="tnved:Declarant/tnved:Chief/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="tnved:Declarant/tnved:Chief/cat_ru:PersonMiddleName"/> 
				<xsl:value-of select="tnved:Declarant/tnved:Chief/cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">3. Регистрационный номер 
					<xsl:value-of select="tnved:RegistrationNumber"/>
				<!--xsl:value-of select="tnved:RegistrationNumber/tnved:CountryCode"/>/
				<xsl:value-of select="tnved:RegistrationNumber/tnved:CustomsCode"/>/
				<xsl:value-of select="tnved:RegistrationNumber/tnved:Year"/>/
				<xsl:value-of select="tnved:RegistrationNumber/tnved:SerialNumber"/-->
               </td>
               <td class="graph10"> 4. Дата принятия (число, месяц, год) 
				<xsl:for-each select="tnved:Date">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">5. Наименование товара, указанное в запросе заявителем 
				<xsl:for-each select="tnved:Goods">
                     <xsl:value-of select="tnved:GoodDescription"/>
                  </xsl:for-each>
               </td>
               <td class="graph10">6. Код товара по ТН ВЭД ЕАЭС 
				<xsl:value-of select="tnved:TNVEDCode"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">7. Сведения о товаре, необходимые для классификации 
				<xsl:for-each select="tnved:GoodsInfoTNVEDCode">
                     <xsl:value-of select="."/> </xsl:for-each>
                  <br/>
                  <xsl:for-each select="tnved:Goods">
                     <xsl:for-each select="tnved:GoodDescription">
				Товар: <xsl:value-of select="."/> 
				</xsl:for-each>
                     <xsl:variable name="x" select="tnved:GoodsInformation"/>
                     <xsl:if test="$x/tnved:GoodsMark">Марка <xsl:value-of select="tnved:GoodsInformation/tnved:GoodsMark"/> </xsl:if>
                     <xsl:if test="$x/tnved:GoodsMarking">Артикул <xsl:value-of select="tnved:GoodsInformation/tnved:GoodsMarking"/> </xsl:if>
                     <xsl:if test="$x/tnved:GoodsStandard">Стандарт <xsl:value-of select="tnved:GoodsInformation/tnved:GoodsStandard"/> </xsl:if>
                     <xsl:if test="$x/tnved:GoodsSort">Сорт <xsl:value-of select="tnved:GoodsInformation/tnved:GoodsSort"/> </xsl:if>
                     <xsl:if test="$x/tnved:WoodSortiment">Наименование сортимента <xsl:value-of select="tnved:GoodsInformation/tnved:WoodSortiment"/> </xsl:if>
                     <xsl:if test="$x/tnved:WoodKind">Порода древесины <xsl:value-of select="tnved:GoodsInformation/tnved:WoodKind"/> </xsl:if>
                     <xsl:if test="$x/tnved:Dimensions">Размеры <xsl:value-of select="tnved:GoodsInformation/tnved:Dimensions"/> </xsl:if>
                     <br/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">8. Обоснование принятия решения 
				<xsl:for-each select="tnved:RationaleDecision">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">9. Для служебных отметок 
				<xsl:for-each select="tnved:Mark">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">10. Подпись должностного лица таможенного органа 
				</td>
            </tr>
            <tr>
               <td align="center" class="graph10">
                  <xsl:value-of select="tnved:PersonSignature/cat_ru:PersonPost"/>
               </td>
               <td align="center" class="graph10">________________ 
				<xsl:value-of select="tnved:PersonSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="tnved:PersonSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="tnved:PersonSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(должность)</td>
               <td align="center" class="graph8">(подпись)        (Ф.И.О.)</td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
