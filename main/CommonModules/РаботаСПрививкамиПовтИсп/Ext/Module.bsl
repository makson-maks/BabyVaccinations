﻿
Функция ПолучитьДанныеОПрививках(ДатаНачалаПериодичности, ДатаОкончанияПериодичности) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПрививкиВОчереди.Ребенок КАК Ребенок,
		|	ПрививкиВОчереди.Прививка КАК Прививка,
		|	ПрививкиВОчереди.ДатаУстановки КАК ДатаУстановки,
		|	ПрививкиВОчереди.ДатаНапоминания КАК ДатаНапоминания,
		|	ПРЕДСТАВЛЕНИЕ(ПрививкиВОчереди.Ребенок) КАК РебенокПредставление,
		|	ПРЕДСТАВЛЕНИЕ(ПрививкиВОчереди.Прививка) КАК ПрививкаПредставление
		|ИЗ
		|	РегистрСведений.ПрививкиВОчереди КАК ПрививкиВОчереди
		|ГДЕ
		|	ПрививкиВОчереди.ДатаУстановки МЕЖДУ &ДатаНачала И &ДатаОкончания";
	
	Запрос.УстановитьПараметр("ДатаНачала", НачалоДня(ДатаНачалаПериодичности));
	Запрос.УстановитьПараметр("ДатаОкончания", КонецДня(ДатаОкончанияПериодичности));
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Возврат ВыборкаДетальныеЗаписи;
	
КонецФункции