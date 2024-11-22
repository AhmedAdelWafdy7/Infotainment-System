/****************************************************************************
** Meta object code from reading C++ file 'InstrumentClusterQtClass.hpp'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../src/HeadUnit/InstrumentClusterQtClass.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'InstrumentClusterQtClass.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_InstrumentClusterQtClass_t {
    QByteArrayData data[14];
    char stringdata0[146];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_InstrumentClusterQtClass_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_InstrumentClusterQtClass_t qt_meta_stringdata_InstrumentClusterQtClass = {
    {
QT_MOC_LITERAL(0, 0, 24), // "InstrumentClusterQtClass"
QT_MOC_LITERAL(1, 25, 12), // "speedChanged"
QT_MOC_LITERAL(2, 38, 0), // ""
QT_MOC_LITERAL(3, 39, 10), // "rpmChanged"
QT_MOC_LITERAL(4, 50, 14), // "batteryChanged"
QT_MOC_LITERAL(5, 65, 11), // "gearChanged"
QT_MOC_LITERAL(6, 77, 16), // "directionChanged"
QT_MOC_LITERAL(7, 94, 12), // "lightChanged"
QT_MOC_LITERAL(8, 107, 5), // "speed"
QT_MOC_LITERAL(9, 113, 3), // "rpm"
QT_MOC_LITERAL(10, 117, 7), // "battery"
QT_MOC_LITERAL(11, 125, 4), // "gear"
QT_MOC_LITERAL(12, 130, 9), // "direction"
QT_MOC_LITERAL(13, 140, 5) // "light"

    },
    "InstrumentClusterQtClass\0speedChanged\0"
    "\0rpmChanged\0batteryChanged\0gearChanged\0"
    "directionChanged\0lightChanged\0speed\0"
    "rpm\0battery\0gear\0direction\0light"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_InstrumentClusterQtClass[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       6,   50, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,
       3,    0,   45,    2, 0x06 /* Public */,
       4,    0,   46,    2, 0x06 /* Public */,
       5,    0,   47,    2, 0x06 /* Public */,
       6,    0,   48,    2, 0x06 /* Public */,
       7,    0,   49,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       8, QMetaType::UShort, 0x00495103,
       9, QMetaType::UShort, 0x00495103,
      10, QMetaType::UShort, 0x00495103,
      11, QMetaType::UShort, 0x00495103,
      12, QMetaType::UShort, 0x00495103,
      13, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

void InstrumentClusterQtClass::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<InstrumentClusterQtClass *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->speedChanged(); break;
        case 1: _t->rpmChanged(); break;
        case 2: _t->batteryChanged(); break;
        case 3: _t->gearChanged(); break;
        case 4: _t->directionChanged(); break;
        case 5: _t->lightChanged(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::speedChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::rpmChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::batteryChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::gearChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::directionChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (InstrumentClusterQtClass::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InstrumentClusterQtClass::lightChanged)) {
                *result = 5;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<InstrumentClusterQtClass *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< quint16*>(_v) = _t->speed(); break;
        case 1: *reinterpret_cast< quint16*>(_v) = _t->rpm(); break;
        case 2: *reinterpret_cast< quint16*>(_v) = _t->battery(); break;
        case 3: *reinterpret_cast< quint16*>(_v) = _t->gear(); break;
        case 4: *reinterpret_cast< quint16*>(_v) = _t->direction(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->light(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<InstrumentClusterQtClass *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setSpeed(*reinterpret_cast< quint16*>(_v)); break;
        case 1: _t->setRpm(*reinterpret_cast< quint16*>(_v)); break;
        case 2: _t->setBattery(*reinterpret_cast< quint16*>(_v)); break;
        case 3: _t->setGear(*reinterpret_cast< quint16*>(_v)); break;
        case 4: _t->setDirection(*reinterpret_cast< quint16*>(_v)); break;
        case 5: _t->setLight(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    (void)_a;
}

QT_INIT_METAOBJECT const QMetaObject InstrumentClusterQtClass::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_InstrumentClusterQtClass.data,
    qt_meta_data_InstrumentClusterQtClass,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *InstrumentClusterQtClass::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *InstrumentClusterQtClass::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_InstrumentClusterQtClass.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int InstrumentClusterQtClass::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void InstrumentClusterQtClass::speedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void InstrumentClusterQtClass::rpmChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void InstrumentClusterQtClass::batteryChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void InstrumentClusterQtClass::gearChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void InstrumentClusterQtClass::directionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void InstrumentClusterQtClass::lightChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
