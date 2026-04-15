/* Copyright 2015-2023 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H

enum planck_keycodes { PLOVER = SAFE_RANGE, BACKLIT, EXT_PLV };
enum planck_layers { _QWRTY, _CLMAK, _ROVER, _SYMBL, _NAVIG, _FUNCT, _ADJST, _PLOVER };

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

// Space-Hyper
#define SP_HP HYPR_T(KC_SPC)

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



/* clang-format off */
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWRTY] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            KC_ESC,     KC_Q,      KC_W,       KC_E,     KC_R,      KC_T,      KC_Y,       KC_U,      KC_I,      KC_O,      KC_P,     KC_BSPC , 
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_TAB,    Q_HM_A,    Q_HM_S,     Q_HM_D,    Q_HM_F,    KC_G,      KC_H,      Q_HM_J,    Q_HM_K,    Q_HM_L,  Q_HM_SCLN,   KC_QUOT ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_LSFT,    KC_Z,      KC_X,       KC_C,     KC_V,      KC_B,      KC_N,       KC_M,    KC_COMM,    KC_DOT,   KC_SLSH,    KC_ENT  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,   XXXXXXX,    ROVER,     NAVIG,     SYMBL,     FUNCT,      SP_HP,    ROVER,     XXXXXXX,   XXXXXXX,   XXXXXXX
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
          ),
    [_CLMAK] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
             KC_ESC,     KC_Q,     KC_W,        KC_E,     KC_R,      KC_T,     KC_Y,       KC_U,      KC_I,      KC_O,      KC_P,     KC_BSPC ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
             KC_TAB,    C_HM_A,    C_HM_R,     C_HM_S,    C_HM_T,    KC_G,     KC_H,      C_HM_N,    C_HM_E,    C_HM_I,    C_HM_O,    KC_QUOT ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
             KC_LSFT,    KC_Z,      KC_X,       KC_C,     KC_V,      KC_B,     KC_N,       KC_M,    KC_COMM,    KC_DOT,   KC_SLSH,    KC_ENT  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
             XXXXXXX,   XXXXXXX,   XXXXXXX,    SYMBL,     NAVIG,     FUNCT,    FUNCT,      SP_HP,    ROVER,     XXXXXXX,  XXXXXXX,    XXXXXXX
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
    
    [_ROVER] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
             KC_GRV,   KC_EXLM,    KC_AT,    KC_HASH,    KC_DLR,   KC_PERC,    KC_CIRC,  KC_AMPR,   KC_ASTR,   KC_LPRN,   KC_RPRN,    KC_BSPC ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_PIPE,     KC_1,      KC_2,      KC_3,      KC_4,      KC_5,      KC_6,      KC_7,      KC_8,      KC_9,      KC_0,     KC_BSLS,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   KC_UNDS,    KC_EQL,   KC_PLUS,   KC_MINS,    KC_COMM,   KC_DOT,    KC_SLSH,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,    ADJST,     _______,   XXXXXXX,   XXXXXXX,   XXXXXXX
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
    
    [_SYMBL] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            KC_TILD,   KC_EXLM,    KC_AT,    KC_UNDS,    KC_EQL,   XXXXXXX,   XXXXXXX,   KC_LPRN,    KC_RPRN,   XXXXXXX,   XXXXXXX,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_LCTL,   XXXXXXX,   XXXXXXX,   KC_MINS,   KC_PLUS,   XXXXXXX,   XXXXXXX,   KC_LBRC,    KC_RBRC,   XXXXXXX,   XXXXXXX,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_LSFT,   XXXXXXX,   XXXXXXX,   KC_LCBR,   KC_RCBR,   XXXXXXX,   XXXXXXX,   KC_LCBR,    KC_RCBR,   XXXXXXX,   XXXXXXX,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,   XXXXXXX,   _______,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
        
    [_FUNCT] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            KC_TILD,   XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            KC_HOME,    KC_F1,      KC_F2,     KC_F3,     KC_F4,     KC_F5,     KC_F6,    KC_F7,      KC_F8,     KC_F9,    KC_F10,    KC_END  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,   XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   _______,  XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX 
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
        
    [_NAVIG] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            XXXXXXX,     RC_PU,    XXXXXXX,   XXXXXXX,    LC_PD,    XXXXXXX,   XXXXXXX,   LSG_LF,   KC_PGUP,    KC_PGDN,   RSG_RG,     KC_DEL ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,    LG_LF,    KC_LEFT,   KC_UP  ,   KC_DOWN,  KC_RIGHT,    RG_RG  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,    RCS_C ,    RCS_V ,   XXXXXXX,   XXXXXXX,    LC_LF ,   LA_UP ,    RA_DN ,    RC_RG ,    XXXXXXX,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   _______,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX 
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
        
    [_ADJST] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            XXXXXXX,     QWRTY,     CLMAK,    XXXXXXX,   XXXXXXX,    VOLUP,    BRIUP,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,    VOLDN,    BRIDN,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,   _______,   _______,   XXXXXXX,   XXXXXXX,   XXXXXXX  
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        ),
        
    [_PLOVER] = LAYOUT_ortho_4x12(
        //,----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------.
            XXXXXXX,     QWRTY,     CLMAK,    XXXXXXX,   XXXXXXX,    VOLUP,    BRIUP,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,    VOLDN,    BRIDN,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX  ,
        //|----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------|
            XXXXXXX,    XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,   XXXXXXX,  XXXXXXX,   _______,   _______,   XXXXXXX,   XXXXXXX,   XXXXXXX  
        //`----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------+----------'
        )
};

#ifdef ENCODER_MAP_ENABLE
/* Rotary Encoders
 */
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    /* Qwerty
     *    v- (index) Clockwise / Counter Clockwise                        v- (index) Clockwise / Counter Clockwise
     * ,---------------------------------------------------------------------------------------.
     * | (0) Vol-    / Vol+    |   |   |   |   |   |   |   |   |   |   | (4) Vol-    / Vol+    |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (1) KC_MNXT / KC_MPRV |   |   |   |   |   |   |   |   |   |   | (5) KC_MNXT / KC_MPRV |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (2) KC_WBAK / KC_WFWD |   |   |   |   |   |   |   |   |   |   | (6) KC_SPC  / KC_ENT  |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (3) KC_LEFT / KC_RGHT |   |   |   |   |       |   |   |   |   | (7) KC_DOWN / KC_UP   |
     * `---------------------------------------------------------------------------------------'
     */
    [_QWERTY] = {
        // LEFT SIDE (index 0 to 3)
        ENCODER_CCW_CW(KC_VOLU, KC_VOLD),
        ENCODER_CCW_CW(KC_MNXT, KC_MPRV),
        ENCODER_CCW_CW(KC_WBAK, KC_WFWD),
        ENCODER_CCW_CW(KC_LEFT, KC_RGHT),
        // RIGHT SIDE (index 4 to 7)
        ENCODER_CCW_CW(KC_VOLU, KC_VOLD),
        ENCODER_CCW_CW(KC_MNXT, KC_MPRV),
        ENCODER_CCW_CW(KC_SPC,  KC_ENT),
        ENCODER_CCW_CW(KC_DOWN, KC_UP)
    },

    /* Adjust (Lower + Raise)
     *    v- (index) Clockwise / Counter Clockwise                        v- (index) Clockwise / Counter Clockwise
     * ,---------------------------------------------------------------------------------------.
     * | (0) _______ / _______ |   |   |   |   |   |   |   |   |   |   | (4) _______ / _______ |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (1) _______ / _______ |   |   |   |   |   |   |   |   |   |   | (5) _______ / _______ |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (2) UG_NEXT / UG_PREV |   |   |   |   |   |   |   |   |   |   | (6) SAT- / SAT+       |
     * |-----------------------+---+---+---+---+---+---+---+---+---+---+-----------------------|
     * | (3) UG_VALD / UG_VALU |   |   |   |   |       |   |   |   |   | (7) HUE- / HUE+       |
     * `---------------------------------------------------------------------------------------'
     */
    [_ADJST] = {
        // LEFT SIDE (index 0 to 3)
        ENCODER_CCW_CW(_______, _______),
        ENCODER_CCW_CW(_______, _______),
        ENCODER_CCW_CW(UG_NEXT, UG_PREV),
        ENCODER_CCW_CW(UG_VALD, UG_VALU),
        // RIGHT SIDE (index 4 to 7)
        ENCODER_CCW_CW(_______, _______),
        ENCODER_CCW_CW(_______, _______),
        ENCODER_CCW_CW(UG_SATD,  UG_SATU),
        ENCODER_CCW_CW(UG_HUEU,  UG_HUED)
    }
};
#endif
/* clang-format on */

#ifdef AUDIO_ENABLE
float plover_song[][2]    = SONG(PLOVER_SOUND);
float plover_gb_song[][2] = SONG(PLOVER_GOODBYE_SOUND);
#endif

bool play_encoder_melody(uint8_t index, bool clockwise);

layer_state_t layer_state_set_user(layer_state_t state) {
    return update_tri_layer_state(state, _ROVER, _SYMBL, _ADJST);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
#ifdef ENCODER_MAP_ENABLE
    if (IS_ENCODEREVENT(record->event) && record->event.pressed) {
        play_encoder_melody(record->event.key.col, record->event.type == ENCODER_CCW_EVENT);
    }
#endif
    switch (keycode) {
        case BACKLIT:
            if (record->event.pressed) {
                register_code(KC_RSFT);
            } else {
                unregister_code(KC_RSFT);
            }
            return false;
            break;
        case PLOVER:
            if (record->event.pressed) {
#ifdef AUDIO_ENABLE
                stop_all_notes();
                PLAY_SONG(plover_song);
#endif
                layer_off(_ROVER);
                layer_off(_ADJST);
                layer_on(_PLOVER);
                if (!eeconfig_is_enabled()) {
                    eeconfig_init();
                }
                eeconfig_read_keymap(&keymap_config);
                keymap_config.nkro = 1;
                eeconfig_update_keymap(&keymap_config);
            }
            return false;
            break;
        case EXT_PLV:
            if (record->event.pressed) {
#ifdef AUDIO_ENABLE
                PLAY_SONG(plover_gb_song);
#endif
                layer_off(_PLOVER);
            }
            return false;
            break;
    }
    return true;
}

/* clang-format off */
float melody[8][2][2] = {
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
    {{440.0f, 8}, {440.0f, 24}},
};
/* clang-format on */

#define JUST_MINOR_THIRD 1.2
#define JUST_MAJOR_THIRD 1.25
#define JUST_PERFECT_FOURTH 1.33333333
#define JUST_TRITONE 1.42222222
#define JUST_PERFECT_FIFTH 1.33333333

#define ET12_MINOR_SECOND 1.059463
#define ET12_MAJOR_SECOND 1.122462
#define ET12_MINOR_THIRD 1.189207
#define ET12_MAJOR_THIRD 1.259921
#define ET12_PERFECT_FOURTH 1.33484
#define ET12_TRITONE 1.414214
#define ET12_PERFECT_FIFTH 1.498307

deferred_token tokens[8];

uint32_t reset_note(uint32_t trigger_time, void *note) {
    *(float*)note = 440.0f;
    return 0;
}

bool play_encoder_melody(uint8_t index, bool clockwise) {
    cancel_deferred_exec(tokens[index]);
    if (clockwise) {
        melody[index][1][0] = melody[index][1][0] * ET12_MINOR_SECOND;
        melody[index][0][0] = melody[index][1][0] / ET12_PERFECT_FIFTH;
        audio_play_melody(&melody[index], 2, false);
    } else {
        melody[index][1][0] = melody[index][1][0] / ET12_MINOR_SECOND;
        melody[index][0][0] = melody[index][1][0] * ET12_TRITONE;
        audio_play_melody(&melody[index], 2, false);
    }
    tokens[index] = defer_exec(1000, reset_note, &melody[index][1][0]);
    return false;
}

bool encoder_update_user(uint8_t index, bool clockwise) {
    return play_encoder_melody(index, clockwise);
}

bool dip_switch_update_user(uint8_t index, bool active) {
    switch (index) {
        case 0: {
#ifdef AUDIO_ENABLE
            static bool play_sound = false;
#endif
            if (active) {
#ifdef AUDIO_ENABLE
                if (play_sound) {
                    PLAY_SONG(plover_song);
                }
#endif
                layer_on(_ADJST);
            } else {
#ifdef AUDIO_ENABLE
                if (play_sound) {
                    PLAY_SONG(plover_gb_song);
                }
#endif
                layer_off(_ADJST);
            }
#ifdef AUDIO_ENABLE
            play_sound = true;
#endif
            break;
        }
    }
    return true;
}
