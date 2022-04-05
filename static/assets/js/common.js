var common = (function () {
	
	var showMessage = function (judul, pesan, type, confirmText) {
        swal.fire({
            title: judul,
            html: pesan,
            icon: type,
            buttonsStyling: false,
            confirmButtonText: confirmText,
            confirmButtonClass: "btn btn-success btn-shadow font-weight-bold"
        });
    };
	
	var showMessageWithAction = function (judul, pesan, type, confirmText, action) {
        swal.fire({
            title: judul,
            html: pesan,
            icon: type,
			allowEscapeKey: false,
			allowOutsideClick: false,
            buttonsStyling: false,
            confirmButtonText: confirmText,
            confirmButtonClass: "btn btn-success btn-shadow font-weight-bold"
        }).then(function(result) {
            if (result.value) {
                action();
            }
        });
    };
	
	var showMessageQuestionWithAction  = function (judul, pesan, confirmText, cancelText, action) {
        swal.fire({
            title: judul,
            html: pesan,
            icon: "question",
			allowEscapeKey: false,
			allowOutsideClick: false,
			confirmButtonText: confirmText,
			buttonsStyling: false,
			confirmButtonClass: "btn btn-success btn-shadow font-weight-bold",
			showCancelButton: true,
			cancelButtonText: cancelText,
			cancelButtonClass: "btn btn-secondary btn-shadow font-weight-bold",
			reverseButtons: true,
		 }).then(function (result) {
			if (result.value) {
			  action();
			}
		 });
    };
	
	var loadingMessage = function (judul, pesan) {
        swal.fire({
            title: judul,
            html: pesan,
            showConfirmButton: false,
            allowOutsideClick: false,
            onOpen: function () {
                swal.showLoading();
            }
        });
    };
	
	var generateTable = function (tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax) {
	    $.fn.DataTable.ext.pager.numbers_length = lengthPage;
	    var table = $("#" + tableId).DataTable({
	        responsive: responsive,
	        searching: search,
	        bDestroy: true,
	        lengthMenu: [
	            [ -1], ["All"]
	        ],
	        pageLength: lengthPage,
	        processing: true,
			paging:   false,
	        ordering: false,
	        language: {
	            // processing:
	            //     '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Sedang memproses...</span>',
	            // sLengthMenu: "Tampilkan _MENU_ entri",
	            // sZeroRecords: "Data tidak ditemukan",
	            // sInfo: "Menampilkan _START_ sampai _END_ dari _TOTAL_ entri",
	            // sInfoEmpty: "Menampilkan 0 sampai 0 dari 0 entri",
	            // sInfoFiltered: "(disaring dari _MAX_ entri keseluruhan)",
	            // sInfoPostFix: "",
	            // sSearch: "Cari:",
	            // sUrl: "",
	            // oPaginate: {
	            //     sFirst: "Pertama",
	            //     sPrevious: "Sebelumnya",
	            //     sNext: "Selanjutnya",
	            //     sLast: "Terakhir",
	            // },
	        },
	        ajax: function (data, callback, settings) {
	            $.ajax({
	                url: url,
	                type: "POST",
	                data: JSON.stringify(param),
	                dataType: "json",
	                contentType: "application/json",
	                mimeType: "application/json",
					xhr: function () {
						var xhr = $.ajaxSettings.xhr();
						return xhr;
					},
					beforeSend: function (xhr) {
					},
	                success: function (data) {
	                    if (data.code == 1) {
	                        callback(data.data);
	                    } else {
	                        callback({});
	                    }
	                },
	                statusCode: {
	                    401: function () {
	                        var actErrorMessage = function () {
	                            location.reload();
	                        };
	                        common.showMessageWithAction(
	                            "Kesalahan",
	                            "Session telah berakhir. Silahkan login ulang.",
	                            "error",
	                            "Tutup",
	                            actErrorMessage
	                        );
	                    },
	                    400: function () {
	                        callback({});
	                    },
	                    404: function () {
	                        callback({});
	                    },
	                    403: function () {
	                        callback({});
	                    },
	                },
	            }).fail(function () {
	                callback({});
	            });
	        },
	        sAjaxDataProp: "",
	        order: [[0, order]],
	        columns: columnsArr,
	        columnDefs: columnDefsArr,
	        // drawCallback: function (settings) {
	        //     $('[data-toggle="kt-tooltip"]').tooltip({
	        //         trigger: "hover",
	        //     });
	        // },
			initComplete: function( settings, json ) {
				initAjax();
			}
	    });
	    if (autoNum == true) {
	        table
	            .on("order.dt search.dt", function () {
	                table
	                    .column(0, {search: "applied", order: "applied"})
	                    .nodes()
	                    .each(function (cell, i) {
	                        cell.innerHTML = i + 1;
	                    });
	            })
	            .draw();
	    }
		afterAjax();
	}

    var generateTable2 = function (tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax) {
        $.fn.DataTable.ext.pager.numbers_length = lengthPage;
        var table = $("#" + tableId).DataTable({
            responsive: responsive,
            searching: search,
            bDestroy: true,
            lengthMenu: [[5, 25, 50, 100, -1], [5, 25, 50, 100, "All"]],
            pageLength: lengthPage,
            processing: true,
            paging:   true,
            ordering: true,
            language: {
                // processing:
                //     '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Sedang memproses...</span>',
                // sLengthMenu: "Tampilkan _MENU_ entri",
                // sZeroRecords: "Data tidak ditemukan",
                // sInfo: "Menampilkan _START_ sampai _END_ dari _TOTAL_ entri",
                // sInfoEmpty: "Menampilkan 0 sampai 0 dari 0 entri",
                // sInfoFiltered: "(disaring dari _MAX_ entri keseluruhan)",
                // sInfoPostFix: "",
                // sSearch: "Cari:",
                // sUrl: "",
                // oPaginate: {
                //     sFirst: "Pertama",
                //     sPrevious: "Sebelumnya",
                //     sNext: "Selanjutnya",
                //     sLast: "Terakhir",
                // },
            },
            ajax: function (data, callback, settings) {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: JSON.stringify(param),
                    dataType: "json",
                    contentType: "application/json",
                    mimeType: "application/json",
                    xhr: function () {
                        var xhr = $.ajaxSettings.xhr();
                        return xhr;
                    },
                    beforeSend: function (xhr) {
                    },
                    success: function (data) {
                        if (data.code == 1) {
                            callback(data.data);
                        } else {
                            callback({});
                        }
                    },
                    statusCode: {
                        401: function () {
                            var actErrorMessage = function () {
                                location.reload();
                            };
                            common.showMessageWithAction(
                                "Kesalahan",
                                "Session telah berakhir. Silahkan login ulang.",
                                "error",
                                "Tutup",
                                actErrorMessage
                            );
                        },
                        400: function () {
                            callback({});
                        },
                        404: function () {
                            callback({});
                        },
                        403: function () {
                            callback({});
                        },
                    },
                }).fail(function () {
                    callback({});
                });
            },
            sAjaxDataProp: "",
            order: [[0, order]],
            columns: columnsArr,
            columnDefs: columnDefsArr,
            drawCallback: function (settings) {
                $('[data-toggle="kt-tooltip"]').tooltip({
                    trigger: "hover",
                });
            },
            initComplete: function( settings, json ) {
                initAjax();
            }
        });
        if (autoNum == true) {
            table
                .on("order.dt search.dt", function () {
                    table
                        .column(0, {search: "applied", order: "applied"})
                        .nodes()
                        .each(function (cell, i) {
                            cell.innerHTML = i + 1;
                        });
                })
                .draw();
        }
        afterAjax();
    }

    var generateTable3 = function (tableId, url, param, lengthPage, lengthMenu, ordering, paging, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax) {
        $.fn.DataTable.ext.pager.numbers_length = lengthPage;
        var table = $("#" + tableId).DataTable({
            responsive: responsive,
            searching: search,
            bDestroy: true,
            lengthMenu: lengthMenu,
            pageLength: lengthPage,
            processing: true,
            paging:   paging,
            ordering: ordering,
            language: {
                // processing:
                //     '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Sedang memproses...</span>',
                // sLengthMenu: "Tampilkan _MENU_ entri",
                // sZeroRecords: "Data tidak ditemukan",
                // sInfo: "Menampilkan _START_ sampai _END_ dari _TOTAL_ entri",
                // sInfoEmpty: "Menampilkan 0 sampai 0 dari 0 entri",
                // sInfoFiltered: "(disaring dari _MAX_ entri keseluruhan)",
                // sInfoPostFix: "",
                // sSearch: "Cari:",
                // sUrl: "",
                // oPaginate: {
                //     sFirst: "Pertama",
                //     sPrevious: "Sebelumnya",
                //     sNext: "Selanjutnya",
                //     sLast: "Terakhir",
                // },
            },
            ajax: function (data, callback, settings) {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: JSON.stringify(param),
                    dataType: "json",
                    contentType: "application/json",
                    mimeType: "application/json",
                    xhr: function () {
                        var xhr = $.ajaxSettings.xhr();
                        return xhr;
                    },
                    beforeSend: function (xhr) {
                    },
                    success: function (data) {
                        if (data.code == 1) {
                            callback(data.data);
                        } else {
                            callback({});
                        }
                    },
                    statusCode: {
                        401: function () {
                            var actErrorMessage = function () {
                                location.reload();
                            };
                            common.showMessageWithAction(
                                "Kesalahan",
                                "Session telah berakhir. Silahkan login ulang.",
                                "error",
                                "Tutup",
                                actErrorMessage
                            );
                        },
                        400: function () {
                            callback({});
                        },
                        404: function () {
                            callback({});
                        },
                        403: function () {
                            callback({});
                        },
                    },
                }).fail(function () {
                    callback({});
                });
            },
            sAjaxDataProp: "",
            order: order,
            columns: columnsArr,
            columnDefs: columnDefsArr,
            drawCallback: function (settings) {
                $('[data-toggle="kt-tooltip"]').tooltip({
                    trigger: "hover",
                });
            },
            initComplete: function( settings, json ) {
                initAjax();
            }
        });
        if (autoNum == true) {
            table
                .on("order.dt search.dt", function () {
                    table
                        .column(0, {search: "applied", order: "applied"})
                        .nodes()
                        .each(function (cell, i) {
                            cell.innerHTML = i + 1;
                        });
                })
                .draw();
        }
        afterAjax();
    }
	
	var addContent = function (param, file, idSubmit, contentType) {
		
		var data = new FormData();

        if (typeof file === "undefined") {
            data.append('file', null);
        }else{
            data.append('file', file);
        }

        data.append('param', param);

        $('#'+idSubmit).attr('disabled', true);

        Swal.fire({
            title: 'Memproses ' + contentType,
            showConfirmButton: false,
            showCloseButton: false,
            showCancelButton: false,
            allowEscapeKey: false,
            allowOutsideClick: false,
            html:
                '<div id="progressParent" class="progress progress-lg" role="progressbar">' +
                '<div id="progress" class="progress-bar progress-bar-striped progress-bar-animated progress-lg"' +
                'role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;text-align: center"></div>',
            didOpen: function () {
                swal.showLoading();
            }
        });

        var ajaxReq = $.ajax({
            url: '/ajax/addContent',
            type: 'POST',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {
                var xhr = $.ajaxSettings.xhr();

                xhr.upload.onprogress = function (event) {
                    var perc = Math.round((event.loaded / event.total) * 100);
                    $('#progress').text(perc + '%');
                    $('#progress').css('width', perc + '%');
                };
                return xhr;
            },
            beforeSend: function (xhr) {
                //Reset alert message and progress bar
                $('#progress').text('');
                $('#progress').css('width', '0%');
            }
        });

        ajaxReq.done(function (data) {
            setTimeout(function () {
                if (data === null || data === "") {
                    common.showMessage("Kesalahan", "Terjadi kegagalan server. Mohon ulangi kembali", "error", "OK");
                } else {
                    if(data.code == 1){
                        var action = function () {
                            location.reload();
                        };
                        common.showMessageWithAction(data.status, data.message, "success", "Oke", action);
                    } else {
                        common.showMessage(data.status, data.message, "error", "Tutup");
                    }
                }
                $('#'+idSubmit).removeAttr('disabled');
            }, 1000);
        });
		
	};
	
	var deleteContent = function (idKonten) {
		
		var param = JSON.stringify({
            idKonten: idKonten
        });
		
        Swal.fire({
            title: 'Menghapus',
            showConfirmButton: false,
            showCloseButton: false,
            showCancelButton: false,
            allowEscapeKey: false,
            allowOutsideClick: false,
            html:
                '<div id="progressParent" class="progress progress-lg" role="progressbar">' +
                '<div id="progress" class="progress-bar progress-bar-striped progress-bar-animated progress-lg"' +
                'role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;text-align: center"></div>',
            didOpen: function () {
                swal.showLoading();
            }
        });

        var ajaxReq = $.ajax({
            url: '/ajax/delContent',
            type: 'POST',
            data: param,
			dataType: "json",
			contentType: "application/json",
			mimeType: "application/json",
            xhr: function () {
                var xhr = $.ajaxSettings.xhr();

                xhr.upload.onprogress = function (event) {
                    var perc = Math.round((event.loaded / event.total) * 100);
                    $('#progress').text(perc + '%');
                    $('#progress').css('width', perc + '%');
                };
                return xhr;
            },
            beforeSend: function (xhr) {
                //Reset alert message and progress bar
                $('#progress').text('');
                $('#progress').css('width', '0%');
            }
        });

        ajaxReq.done(function (data) {
            setTimeout(function () {
                if (data === null || data === "") {
                    common.showMessage("Kesalahan", "Terjadi kegagalan server. Mohon ulangi kembali", "error", "OK");
                } else {
                    if(data.code == 1){
                        var action = function () {
                            location.reload();
                        };
                        common.showMessageWithAction("Sukses", data.message, "success", "Oke", action);
                    } else {
                        common.showMessage("Error", data.message, "error", "Tutup");
                    }
                }
            }, 1000);
        });
		
	};
	
	var orderContent = function (param) {
		
        Swal.fire({
            title: 'Menyimpan',
            showConfirmButton: false,
            showCloseButton: false,
            showCancelButton: false,
            allowEscapeKey: false,
            allowOutsideClick: false,
            html:
                '<div id="progressParent" class="progress progress-lg" role="progressbar">' +
                '<div id="progress" class="progress-bar progress-bar-striped progress-bar-animated progress-lg"' +
                'role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;text-align: center"></div>',
            didOpen: function () {
                swal.showLoading();
            }
        });

        var ajaxReq = $.ajax({
            url: '/ajax/orderContent',
            type: 'POST',
            data: param,
			dataType: "json",
			contentType: "application/json",
			mimeType: "application/json",
            xhr: function () {
                var xhr = $.ajaxSettings.xhr();

                xhr.upload.onprogress = function (event) {
                    var perc = Math.round((event.loaded / event.total) * 100);
                    $('#progress').text(perc + '%');
                    $('#progress').css('width', perc + '%');
                };
                return xhr;
            },
            beforeSend: function (xhr) {
                //Reset alert message and progress bar
                $('#progress').text('');
                $('#progress').css('width', '0%');
            }
        });

        ajaxReq.done(function (data) {
            setTimeout(function () {
                if (data === null || data === "") {
                    common.showMessage("Kesalahan", "Terjadi kegagalan server. Mohon ulangi kembali", "error", "OK");
                } else {
                    if(data.code == 1){
                        var action = function () {
                            location.reload();
                        };
                        common.showMessageWithAction("Sukses", data.message, "success", "Oke", action);
                    } else {
                        common.showMessage("Error", data.message, "error", "Tutup");
                    }
                }
            }, 1000);
        });
		
	};
	
	var ajaxPost = function(beforeAjax, paramAjax, urlAjax, doneAjax) {
		beforeAjax();
		$.ajax({
		  url: urlAjax,
		  type: "POST",
		  data: paramAjax,
		  dataType: "json",
		  contentType: "application/json",
		  mimeType: "application/json",
		})
		.done(function (data) {
			doneAjax(data);
		})
		.fail(function (jqXHR, textStatus, errorThrown) {
			var actErrorMessage = function () {
			  location.reload();
			};
			common.showMessageWithAction(
			  "Error",
			  "Silahkan coba kembali beberapa saat lagi.",
			  "error",
			  "Tutup",
			  actErrorMessage
			);
		});
	};

    var validateForm = function(formParam, rulesParam, action) {
        var form = formParam;
        var error = $('.alert-danger', form);
        var success = $('.alert-success', form);

        jQuery.validator.addMethod("noSpace", function (value, element) {
            return value.indexOf("_") < 0 && value !== "";
        }, "Isian belum lengkap");

        jQuery.validator.addMethod("noZero", function (value, element) {
            return value !== "0";
        }, "Isian tidak boleh 0");

        jQuery.validator.addMethod("numericDotDash", function (value, element) {
            var regex = new RegExp("^[0-9.-]+$");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian hanya boleh angka, titik(.), strip(-)");

        jQuery.validator.addMethod("alphanumericDotDash", function (value, element) {
            var regex = new RegExp("^[0-9A-Za-z./-]+$");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian hanya boleh huruf, angka, titik(.), strip(-), garis miring(/)");

        jQuery.validator.addMethod("alphanumericSpaceDotCommaDashSingleQuote", function (value, element) {
            var regex = new RegExp("^[0-9A-Za-z .,'-]+$");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian hanya boleh huruf, angka, spasi, titik(.), koma(,),  petik tunggal('), strip(-)");

        jQuery.validator.addMethod("alphanumeric", function (value, element) {
            var regex = new RegExp("^[0-9A-Za-z]+$");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian hanya boleh huruf dan angka");

        jQuery.validator.addMethod("numeric", function (value, element) {
            var regex = new RegExp("^[0-9]+$");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian hanya boleh angka");

        jQuery.validator.addMethod("firstMustBeZero", function (value, element) {
            var regex = new RegExp("^[0]");
            var key = value;

            if (!regex.test(key)) {
                return false;
            }
            return true;
        }, "Isian harus dimulai dengan '0'");

        jQuery.validator.addMethod("passwordCheck",
        function(value, element, param) {
            if (this.optional(element)) {
                return true;
            } else if (!/[A-Z]/.test(value)) {
                return false;
            } else if (!/[a-z]/.test(value)) {
                return false;
            } else if (!/[0-9]/.test(value)) {
                return false;
            }

            return true;
        }, "Kata sandi harus menggunakan kombinasi huruf kapital, huruf kecil dan angka.");

        jQuery.validator.addMethod("newPasswordNotEqualOldPassword", function(value, element, param) {
         return this.optional(element) || value != $(param).val();
        }, "Kata sandi baru tidak boleh sama dengan kata sandi lama");

        $.validator.addMethod("checklower", function(value) {
          return /[a-z]/.test(value);
        });
        $.validator.addMethod("checkupper", function(value) {
          return /[A-Z]/.test(value);
        });
        $.validator.addMethod("checkdigit", function(value) {
          return /[0-9]/.test(value);
        });
        
        form.validate({
            errorElement: 'span',
            errorClass: 'text-left ml-3 invalid-feedback',
            focusInvalid: false,
            ignore: "",
            rules: rulesParam,
            messages: {
                email : {
                    email : "Silakan masukkan format email yang benar."        
                },
                pass: {
                  checklower: "Harus mengandung huruf kecil.",
                  checkupper: "Harus mengandung huruf kapital.",
                  checkdigit: "Harus mengandung angka."
                }
            },

            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").length > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.parent(".kt-input-icon").length > 0) {
                    error.insertAfter(element.parent(".kt-input-icon"));
                } else if (element.attr("data-error-container")) {
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents(".kt-radio-list").length > 0) {
                    error.appendTo(element.parents(".kt-radio-list").attr("data-error-container"));
                } else if (element.parents(".kt-radio-inline").length > 0) {
                    error.appendTo(element.parents(".kt-radio-inline").attr("data-error-container"));
                } else if (element.parents(".checkbox-list").length > 0) {
                    error.appendTo(element.parents(".checkbox-list").attr("data-error-container"));
                } else if (element.parents(".checkbox-inline").length > 0) {
                    error.appendTo(element.parents(".checkbox-inline").attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },
            invalidHandler: function (event, validator) {
                success.hide();
                error.show();
                // Metronic.scrollTo(error, -200);
                KTUtil.scrollTop();
            },
            highlight: function (element) {
                $(element)
                        .closest('.form-group')
                        .addClass('has-error');
                $(element)
                        .addClass('is-invalid');
            },
            unhighlight: function (element) {
                $(element)
                        .closest('.form-group')
                        .removeClass('has-error');
                $(element)
                        .removeClass('is-invalid');
            },
            success: function (label) {
                label
                        .closest('.form-group')
                        .removeClass('has-error');
                label
                        .removeClass('is-invalid');
            },
            submitHandler: function (form, event) {
                // success.show();
				event.preventDefault();
                error.hide();
                action(form);
            }
        });
    }
    ;

    var refreshCaptcha = function (element) {
        $(element).hide().attr('src', '/captcha-image?' + Math.floor(Math.random() * 100)).fadeIn();
    };
    
    $('#captchaImage').on("click", function () {
        common.refreshCaptcha(this);
    });

    $('.set-select2').each(function () {
        $(this).select2({
            placeholder: $(this).attr('data-placeholder'),
            allowClear: true
        });
    });
	
	$('.password-format button').on('click', function(){
		if($(this).parents('.password-format').find('input').prop('type') === 'password'){
			$(this).parents('.password-format').find('input').prop('type', 'text');
			$(this).find('i').addClass('la-eye');
			$(this).find('i').removeClass('la-eye-slash');
		}else{
			$(this).parents('.password-format').find('input').prop('type', 'password');
			$(this).find('i').removeClass('la-eye');
			$(this).find('i').addClass('la-eye-slash');
		}
	});


    var setCurrency = function () {
        $(".currency").autoNumeric('init', {aSep: '.', aDec: ',', mDec: '0', vMin: "0", vMax: '1000000000000000'})
    };

    function getValue(elem) {
        return $(elem).autoNumeric('get');
    }

    function setValue(elem, value) {
        return $(elem).autoNumeric('set', value !== null ? value : '0');
    }

    function destroyAutonumeric(elem) {
        return $(elem).autoNumeric('destroy');
    }

	
	return{
        init: function () {

        },
		showMessage: function (title, message, type, confirmText) {
            showMessage(title, message, type, confirmText);
        },
		showMessageWithAction: function (title, message, type, confirmText, action) {
            showMessageWithAction(title, message, type, confirmText, action);
        },
		showMessageQuestionWithAction: function (title, message, confirmText, cancelText, action) {
            showMessageQuestionWithAction(title, message, confirmText, cancelText, action);
        },
		loadingMessage: function (judul, pesan) {
            loadingMessage(judul, pesan);
        },
		addContent: function (param, file, idSubmit, contentType){
			addContent(param, file, idSubmit, contentType)
		},
		deleteContent: function (idKonten){
			deleteContent(idKonten)
		},
		orderContent: function (param){
			orderContent(param)
		},
		ajaxPost: function (beforeAjax, paramAjax, urlAjax, doneAjax){
			ajaxPost(beforeAjax, paramAjax, urlAjax, doneAjax)
		},
		generateTable: function (tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax){
			generateTable(tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax)
		},
        generateTable2: function (tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax){
            generateTable2(tableId, url, param, lengthPage, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax)
        },
        generateTable3: function (tableId, url, param, lengthPage, lengthMenu, ordering, paging, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax){
            generateTable3(tableId, url, param, lengthPage, lengthMenu, ordering, paging, order, columnsArr, columnDefsArr, responsive, search, autoNum, initAjax, afterAjax)
        },
        validateForm: function (formParam, rulesParam, action) {
            validateForm(formParam, rulesParam, action);
        },
        refreshCaptcha: function (element) {
            refreshCaptcha(element);
        },
        setCurrency: function () {
            setCurrency();
        },
        getValue: function (elem) {
            return getValue(elem);
        },
        setValue: function (elem, value) {
          return setValue(elem, value);
        },
        destroyAutonumeric: function (elem) {
            return destroyAutonumeric(elem);
        },
	}
})();