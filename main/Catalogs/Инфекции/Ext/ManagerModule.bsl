﻿
#Область ПрограммныйИнтерфейс

Функция СформироватьДанныеИнфекций() Экспорт
	
	// Возраст указывается как КоличествоМесяцев.КоличествоНедель
	// Пример 4.2 - это четыре с половиной месяца (4 месяца и 2 недели)
	// Пример 4.5 - это пять месяцев и одна неделя (4 месяца и 5 недель)
	
	СписокИнфекций = Новый Соответствие;
	
	#Область ВирусныйГепатитВ
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(0);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(1);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(6);
	
	ДанныеИнфекции.Вакцины.Добавить(Справочники.Вакцины.РегевакВ);
	
	СписокИнфекций.Вставить(Справочники.Инфекции.ВирусныйГепатитВ, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Дифтерия
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(3);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(4.2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(6);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(18);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(168);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Дифтерия, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Коклюш
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(3);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(4.2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(6);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(18);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Коклюш, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Корь
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(12);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Корь, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Краснуха
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(12);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Краснуха, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область ПневмококковаяИнфекция
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(4.2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(15);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.ПневмококковаяИнфекция, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Полиомиелит
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(3);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(4.2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(6);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(18);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(20);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(168);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Полиомиелит, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Столбняк
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(3);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(4.2);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(6);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(18);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(168);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Столбняк, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область Туберкулез
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(0);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.Туберкулез, ДанныеИнфекции);
	
	#КонецОбласти
	
	#Область ЭпидемическийПаротит
	
	ДанныеИнфекции = ПолучитьСтруктуруДанныхИнфекций();
	ДанныеИнфекции.ВходитВНациональныйКалендарь = Истина;
	
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(12);
	ДанныеИнфекции.МесяцаВакцинаций.Добавить(72);
	
	//ДанныеИнфекции.Вакцины.Добавить();
	
	СписокИнфекций.Вставить(Справочники.Инфекции.ЭпидемическийПаротит, ДанныеИнфекции);
	
	#КонецОбласти
	
	Возврат СписокИнфекций;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыФункции

Функция ПолучитьСтруктуруДанныхИнфекций()
	
	СтруктураДанных = Новый Структура;
	СтруктураДанных.Вставить("ВходитВНациональныйКалендарь", Ложь);
	СтруктураДанных.Вставить("МесяцаВакцинаций", Новый Массив);
	СтруктураДанных.Вставить("Вакцины", Новый Массив);
	
	Возврат СтруктураДанных; 
	
КонецФункции

#КонецОбласти