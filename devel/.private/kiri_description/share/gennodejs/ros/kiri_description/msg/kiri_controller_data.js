// Auto-generated. Do not edit!

// (in-package kiri_description.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class kiri_controller_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired_positions = null;
      this.new_positions = null;
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('desired_positions')) {
        this.desired_positions = initObj.desired_positions
      }
      else {
        this.desired_positions = [];
      }
      if (initObj.hasOwnProperty('new_positions')) {
        this.new_positions = initObj.new_positions
      }
      else {
        this.new_positions = [];
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type kiri_controller_data
    // Serialize message field [desired_positions]
    bufferOffset = _arraySerializer.float64(obj.desired_positions, buffer, bufferOffset, null);
    // Serialize message field [new_positions]
    bufferOffset = _arraySerializer.float64(obj.new_positions, buffer, bufferOffset, null);
    // Serialize message field [error]
    bufferOffset = _arraySerializer.float64(obj.error, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type kiri_controller_data
    let len;
    let data = new kiri_controller_data(null);
    // Deserialize message field [desired_positions]
    data.desired_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [new_positions]
    data.new_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [error]
    data.error = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.desired_positions.length;
    length += 8 * object.new_positions.length;
    length += 8 * object.error.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kiri_description/kiri_controller_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e0ab2c92f00a5fd025ef0b87b36cd6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] desired_positions
    float64[] new_positions
    float64[] error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new kiri_controller_data(null);
    if (msg.desired_positions !== undefined) {
      resolved.desired_positions = msg.desired_positions;
    }
    else {
      resolved.desired_positions = []
    }

    if (msg.new_positions !== undefined) {
      resolved.new_positions = msg.new_positions;
    }
    else {
      resolved.new_positions = []
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = []
    }

    return resolved;
    }
};

module.exports = kiri_controller_data;
