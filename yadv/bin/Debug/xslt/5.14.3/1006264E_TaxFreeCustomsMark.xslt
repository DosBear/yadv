<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tfr_cm="urn:customs.ru:Information:CustomsDocuments:TaxFreeCustomsMark:5.14.3">
  <!-- Шаблон для типа TaxFreeCustomsMarkType -->
  <xsl:template match="tfr_cm:TaxFreeCustomsMark">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Чек TaxFree c отметками ТО</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
          <xsl:if test="tfr_cm:Digest">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Контрольная сумма предшествующего документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="tfr_cm:Digest" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="tfr_cm:TypographNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Типографский номер чека TaxFree</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="tfr_cm:TypographNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный номер чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="tfr_cm:TaxFreeID" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Порядковый номер чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="tfr_cm:TaxFreeNumber" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата формирования чека TaxFree</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="tfr_cm:TaxFreeDate"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <xsl:if test="tfr_cm:TaxFreeBuyer">
            <div class="title marg-top">Сведения о покупателе</div>
            <div>
              <xsl:apply-templates select="tfr_cm:TaxFreeBuyer">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">ИНН продавца</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="tfr_cm:SellerINN" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Признак истечения 3 месяцев с момента выдачи чека</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="tfr_cm:ThreeMonthPassedSign='true'">
                    <xsl:text>есть</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>нет</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <xsl:if test="tfr_cm:CustomsMark">
            <div class="title marg-top">Отметки ТО</div>
            <div>
              <xsl:apply-templates select="tfr_cm:CustomsMark">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа tfr_cm:TfSlCountryType -->
  <xsl:template match="tfr_cm:CountryPermanentResidence">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование Страны</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:CountryName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код страны alpha-2 (две буквы латинского алфавита)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:CountryCode" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="tfr_cm:Customs">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа tfr_cm:CustomsMarkType -->
  <xsl:template match="tfr_cm:CustomsMark">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="tfr_cm:Comments">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Коментарий ТО</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="tfr_cm:Comments">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="tfr_cm:CustomsPerson">
        <div class="title marg-top">Должностное лицо таможенного органа</div>
        <div>
          <xsl:apply-templates select="tfr_cm:CustomsPerson">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="tfr_cm:Customs">
        <div class="title marg-top">Сведения о таможенном органе</div>
        <div>
          <xsl:apply-templates select="tfr_cm:Customs">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%"><b>Решение ТО</b></td>
          <td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="tfr_cm:Decision='0'">вывоз подтвержден, разрешена компенсация суммы налога</xsl:when>
					<xsl:when test="tfr_cm:Decision='1'">вывоз подтвержден частично, разрешена компенсация суммы налога</xsl:when>
					<xsl:when test="tfr_cm:Decision='2'">вывоз не подтвержден, сведения не соответствуют</xsl:when>
					<xsl:when test="tfr_cm:Decision='3'">товары запрещены к вывозу</xsl:when>
					<xsl:otherwise><xsl:value-of select="tfr_cm:Decision" /></xsl:otherwise>
				</xsl:choose>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата и время формирования отметок</td>
          <td class="value graphMain" style="width:50%">
			<xsl:call-template name="date_time">
				<xsl:with-param select="tfr_cm:TaxFreeCMDate" name="dateTimeIn"/>
			</xsl:call-template>
          </td>
        </tr>
      </table>
      <div class="title marg-top">Отметки о фактически вывозимых товарах</div>
      <table class="bordered">
        <tbody>
          <tr class="title">
            <td class="graphMain bordered">Порядковый номер товара по чеку TaxFree от продавца</td>
            <td class="graphMain bordered">Артикул товара</td>
            <td class="graphMain bordered">Наименование товара по чеку TaxFree от продавца</td>
            <td class="graphMain bordered">Количество товара по чеку</td>
            <td class="graphMain bordered">Количество фактически вывозимого товара</td>
            <td class="graphMain bordered">Сумма налога, исчисленная  из суммы вывозимого товара</td>
            <td class="graphMain bordered">Стоимость вывозимого товара</td>
            <td class="graphMain bordered">Комментарий ТО</td>
          </tr>
          <xsl:for-each select="tfr_cm:TaxFreeCMGoods">
            <xsl:apply-templates select=".">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа tfr_cm:CustomsPersonDetails -->
  <xsl:template match="tfr_cm:CustomsPerson">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:LNP" />
          </td>
        </tr>
      </table>
      <xsl:if test="tfr_cm:CustomsCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="tfr_cm:CustomsCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
  <xsl:template match="tfr_cm:GoodsQuantity|tfr_cm:GoodsQuantityFact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
	<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')" />
	<xsl:if test="cat_ru:MeasureUnitQualifierName">
		<xsl:text> </xsl:text>
		<xsl:value-of select="translate(cat_ru:MeasureUnitQualifierName, '.', ',')" />
	</xsl:if>
	<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		<xsl:text> (</xsl:text>
		<xsl:value-of select="translate(cat_ru:MeasureUnitQualifierCode, '.', ',')" />
		<xsl:text>)</xsl:text>
	</xsl:if>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="tfr_cm:PersonContact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа tfr_cm:TaxFreeSlBuyerType -->
  <xsl:template match="tfr_cm:TaxFreeBuyer">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="tfr_cm:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="tfr_cm:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="tfr_cm:BirthDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата рождения</td>
            <td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="tfr_cm:BirthDate"/>
				</xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="tfr_cm:CountryPermanentResidence">
        <div class="title marg-top">Страна выдачи паспорта</div>
        <div>
          <xsl:apply-templates select="tfr_cm:CountryPermanentResidence">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="tfr_cm:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия паспорта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="tfr_cm:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер паспорта</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="tfr_cm:IdentityCardNumber" />
          </td>
        </tr>
      </table>
      <xsl:if test="tfr_cm:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи паспорта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="tfr_cm:IdentityCardDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="tfr_cm:ExpiryDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок действия паспорта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="tfr_cm:ExpiryDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="tfr_cm:PersonContact">
        <div class="title marg-top">Контактные данные покупателя</div>
        <div>
          <xsl:apply-templates select="tfr_cm:PersonContact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа tfr_cm:TaxFreeCMGoodsType -->
  <xsl:template match="tfr_cm:TaxFreeCMGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="tfr_cm:GoodsNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="tfr_cm:GoodsArticul" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="tfr_cm:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:value-of select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="tfr_cm:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="tfr_cm:GoodsQuantityFact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(tfr_cm:VAT, '.', ',')" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(tfr_cm:TotalCostGoods, '.', ',')" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="tfr_cm:Comments">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:value-of select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>