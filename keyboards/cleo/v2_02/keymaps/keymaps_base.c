#include QMK_KEYBOARD_H
#include "hooks_base.c"

enum cleo_layers { _QWRTY, _CLMAK, _ROVER, _SYMBL, _NAVIG, _FUNCT, _ADJST };

#define QWRTY DF(_QWRTY)
#define CLMAK DF(_CLMAK)
#define ROVER MO(_ROVER)
#define SYMBL MO(_SYMBL)
#define NAVIG MO(_NAVIG)
#define FUNCT MO(_FUNCT)
#define ADJST MO(_ADJST)

// Mods+Arrow keys
#define LSG_LF LSG(KC_LEFT)
#define RSG_RG RSG(KC_RIGHT)
#define LG_LF LGUI(KC_LEFT)
#define RG_RG RGUI(KC_RIGHT)
#define LC_LF LCTL(KC_LEFT)
#define RC_RG RCTL(KC_RIGHT)
#define LA_LF LALT(KC_LEFT)
#define RA_RG RALT(KC_RIGHT)
#define LA_UP LALT(KC_UP)
#define RA_DN RALT(KC_DOWN)

// Mods+other keys
#define RC_PU RCTL(KC_PAGE_UP)
#define LC_PD LCTL(KC_PAGE_DOWN)
#define RCS_C RCS(KC_C)
#define RCS_V RCS(KC_V)

// Media keys
#define VOLUP KC_KB_VOLUME_UP
#define VOLDN KC_KB_VOLUME_DOWN
#define BRIUP KC_BRIGHTNESS_UP
#define BRIDN KC_BRIGHTNESS_DOWN

// *===* HOME-ROW MODS *===*
 
// QWERTY
// Left-hand 
#define Q_HM_A LGUI_T(KC_A)
#define Q_HM_S LALT_T(KC_S)
#define Q_HM_D LSFT_T(KC_D)
#define Q_HM_F LCTL_T(KC_F)
// Right-hand
#define Q_HM_J RCTL_T(KC_J)
#define Q_HM_K RSFT_T(KC_K)
#define Q_HM_L LALT_T(KC_L)
#define Q_HM_SCLN RGUI_T(KC_SCLN)

// Space-Hyper
#define SP_HP HYPR_T(KC_SPC)

// COLEMAK
// Left-hand
#define C_HM_A LGUI_T(KC_A)
#define C_HM_R LALT_T(KC_R)
#define C_HM_S LSFT_T(KC_S)
#define C_HM_T LCTL_T(KC_T)
// Right-hand
#define C_HM_N LGUI_T(KC_N)
#define C_HM_E LALT_T(KC_E)
#define C_HM_I LSFT_T(KC_I)
#define C_HM_O LCTL_T(KC_O)

// ROVER
// Right-hand
#define R_HM_1 LGUI_T(KC_1)
#define R_HM_2 LALT_T(KC_2)
#define R_HM_3 LSFT_T(KC_3)
#define R_HM_4 LCTL_T(KC_4)
// Left-hand
#define R_HM_7 LCTL_T(KC_7)
#define R_HM_8 LSFT_T(KC_8)
#define R_HM_9 LALT_T(KC_9)
#define R_HM_0 LGUI_T(KC_0)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWRTY] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_ESC,   KC_Q,    KC_W,    KC_E,    KC_R,    KC_T  ,                       KC_Y ,   KC_U  ,  KC_I  ,  KC_O  ,   KC_P , KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_TAB,  Q_HM_A,  Q_HM_S,  Q_HM_D,  Q_HM_F,   KC_G  ,                       KC_H,   Q_HM_J,  Q_HM_K , Q_HM_L, Q_HM_SCLN,KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT,  KC_Z  ,  KC_X  ,  KC_C  ,  KC_V  ,  KC_B  ,                       KC_N,    KC_M,   KC_COMM, KC_DOT,  KC_SLSH, KC_ENT ,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                           ROVER ,  NAVIG,  SYMBL,     FUNCT,    SP_HP,   ROVER
                                      //`--------------------------'  `--------------------------'
  ),
  
  //
  [_CLMAK] = LAYOUT_split_3x6_3(
    //,-----------------------------------------------------.                    ,-----------------------------------------------------.
        KC_ESC,   KC_Q,    KC_W,    KC_F,    KC_P,    KC_G,                         KC_J ,   KC_L ,   KC_U  ,  KC_Y  , KC_SCLN, KC_BSPC,
    //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
        KC_TAB,  C_HM_A, C_HM_R ,  C_HM_S , C_HM_T ,  KC_D  ,                       KC_H  , C_HM_N , C_HM_E , C_HM_I,  C_HM_O , KC_QUOT,
    //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
        KC_LSFT,  KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                         KC_K  ,  KC_M  , KC_COMM, KC_DOT , KC_SLSH, KC_ENT ,
    //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                            ROVER  ,  NAVIG,   SYMBL,     FUNCT,   SP_HP,   ROVER
                                        //`--------------------------'  `--------------------------'
  ),
  
  [_ROVER] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_GRV, KC_EXLM,  KC_AT,  KC_HASH,  KC_DLR, KC_PERC ,                      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_BSPC, 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_PIPE, R_HM_1,  R_HM_2,  R_HM_3,  R_HM_4,   KC_5  ,                       KC_6,   R_HM_7,  R_HM_8,  R_HM_9,  R_HM_0,  KC_BSLS, 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, KC_UNDS, KC_EQL ,                      KC_PLUS, KC_MINS, KC_COMM, KC_DOT,  KC_SLSH, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX,  ADJST,  _______
                                      //`--------------------------'  `--------------------------'
  ),
  
  [_SYMBL] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, KC_UNDS, KC_EQL,  XXXXXXX,                      XXXXXXX, KC_LPRN, KC_RPRN, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_MINS, KC_PLUS, XXXXXXX,                      XXXXXXX, KC_LBRC, KC_RBRC, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_LCBR, KC_RCBR, XXXXXXX,                      XXXXXXX, KC_LCBR, KC_RCBR, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [_NAVIG] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,  RC_PU , XXXXXXX, XXXXXXX,  LC_PD , XXXXXXX,                      XXXXXXX, LSG_LF , KC_PGUP, KC_PGDN, RSG_RG , KC_DEL,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                       LG_LF , KC_LEFT,  KC_UP , KC_DOWN,KC_RIGHT,  RG_RG ,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX,  RCS_C ,  RCS_V , XXXXXXX,                      XXXXXXX,  LC_LF ,  LA_UP ,  RA_DN ,  RC_RG , XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         XXXXXXX, _______, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),
   
  [_FUNCT] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_TILD, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_HOME,  KC_F1 ,  KC_F2 ,  KC_F3 ,  KC_F4 ,  KC_F5 ,                       KC_F6 ,  KC_F7 ,  KC_F8 ,  KC_F9 , KC_F10 , KC_END , 
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    _______, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [_ADJST] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,  QWRTY ,  CLMAK , XXXXXXX, XXXXXXX,  VOLUP ,                       BRIUP , XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RGB_TOG, RGB_HUI, RGB_SAI, RGB_VAI, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RGB_MOD, RGB_HUD, RGB_SAD, RGB_VAD, XXXXXXX,  VOLDN ,                       BRIDN , XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, _______, _______
                                      //`--------------------------'  `--------------------------'
  )
};

led_config_t g_led_config = { {
  // Key Matrix to LED Index
  {   19, 18, 13, 12, 5, 4 },
  {   20, 17, 14, 11, 6, 3 },
  {   21, 16, 15, 10, 7, 2 },
  {   9, 8, 1 },

  {   44, 43, 38, 37, 30, 29 },
  {   45, 42, 39, 36, 31, 28 },
  {   46, 41, 40, 35, 32, 27 },
  {   34, 33, 26 }

}, {
  // LED Index to Physical Position
  { 100, 0 },{ 90, 21 },{ 90, 42 },{ 90, 63 }, // Col 5
  { 72, 63 },{ 72, 42 },{ 72, 21 },{ 81, 0 }, // Col 4
  { 62, 0 }, { 54, 21 }, { 54, 42 }, { 54, 63 }, // Col 3
  { 36, 63 }, { 36, 42 }, { 36, 21 }, // Col 2
  { 18, 21 }, { 18, 42 }, { 18, 63 }, // Col 1
  { 0, 63 }, { 0, 42 }, { 0, 21 }, // Col 0 
  { 25, 30 },{ 25,  50 }, { 80,  50 },{ 80,  20 }, { 25, 30 },{ 25,  50 }, { 80,  50 },{ 80,  20 }, { 80,  50 },{ 80,  20 }, // Underglow

  { 115, 0 },{ 134, 21 },{ 134, 42 },{ 134, 63 }, // Col 0
  { 152, 63 },{ 152, 42 },{ 152, 21 },{ 145, 0 }, // Col 1
  { 160, 0 }, { 170, 21 }, { 170, 42 }, { 170, 63 }, // Col 2
  { 188, 63 }, { 188, 42 }, { 188, 21 }, // Col 3
  { 206, 21 }, { 206, 42 },{ 206, 63 }, // Col 4
  { 223, 63 }, { 223, 42 }, { 223, 21 }, // Col 5
  { 190, 30 },{ 190,  50 }, { 140,  50 }, { 140,  20 }, { 190, 30 },{ 190,  50 }, { 140,  50 }, { 140,  20 }, { 140,  50 }, { 140,  20 } // Underglow
}, {
  // LED Index to Flag
  4,4,4,4,4,4, 4,4,4,4,4,4, 4,4,4,4,4,4, 4,4,4, 2,2,2,2,2,2,2,2,2,2,
  4,4,4,4,4,4, 4,4,4,4,4,4, 4,4,4,4,4,4, 4,4,4, 2,2,2,2,2,2,2,2,2,2
} };


void housekeeping_task_user() {
    hooks_housekeeping_task_user();
}