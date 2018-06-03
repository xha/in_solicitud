<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "users".
 *
 * @property string $uid
 * @property string $name
 * @property string $pass
 * @property string $mail
 * @property string $theme
 * @property string $signature
 * @property string $signature_format
 * @property integer $created
 * @property integer $access
 * @property integer $login
 * @property integer $status
 * @property string $timezone
 * @property string $language
 * @property integer $picture
 * @property string $init
 * @property resource $data
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'users';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid'], 'required'],
            [['uid', 'created', 'access', 'login', 'status', 'picture'], 'integer'],
            [['data'], 'string'],
            [['name'], 'string', 'max' => 60],
            [['pass'], 'string', 'max' => 128],
            [['mail', 'init'], 'string', 'max' => 254],
            [['theme', 'signature', 'signature_format'], 'string', 'max' => 255],
            [['timezone'], 'string', 'max' => 32],
            [['language'], 'string', 'max' => 12],
            [['name'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'uid' => 'Uid',
            'name' => 'Name',
            'pass' => 'Pass',
            'mail' => 'Mail',
            'theme' => 'Theme',
            'signature' => 'Signature',
            'signature_format' => 'Signature Format',
            'created' => 'Created',
            'access' => 'Access',
            'login' => 'Login',
            'status' => 'Status',
            'timezone' => 'Timezone',
            'language' => 'Language',
            'picture' => 'Picture',
            'init' => 'Init',
            'data' => 'Data',
        ];
    }
}
