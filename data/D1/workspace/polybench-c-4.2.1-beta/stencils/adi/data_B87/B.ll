; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @print_array([1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.lr.ph5:
  br label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %._crit_edge.us, %.lr.ph5
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next9, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv8, 1000
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph.us.new

._crit_edge.us:                                   ; preds = %.lr.ph.us.new
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph.us.new.preheader

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.lr.ph27:
  br label %.lr.ph11.preheader

.lr.ph11.preheader:                               ; preds = %._crit_edge24..lr.ph11.preheader_crit_edge, %.lr.ph27
  %.0325 = phi i32 [ 1, %.lr.ph27 ], [ %146, %._crit_edge24..lr.ph11.preheader_crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge8..lver.check_crit_edge, %.lr.ph11.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge8..lver.check_crit_edge ], [ 0, %.lr.ph11.preheader ]
  %indvars.iv31 = phi i64 [ %13, %._crit_edge8..lver.check_crit_edge ], [ 1, %.lr.ph11.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %5 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv31
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv31, -1
  %13 = add nuw nsw i64 %indvars.iv31, 1
  %bound0 = icmp ult double* %scevgep, %scevgep64
  %bound1 = icmp ult double* %scevgep62, %scevgep60
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lver.check..ph.lver.orig_crit_edge, label %.ph

.lver.check..ph.lver.orig_crit_edge:              ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.lver.check..ph.lver.orig_crit_edge
  %indvars.iv.lver.orig = phi i64 [ 1, %.lver.check..ph.lver.orig_crit_edge ], [ %indvars.iv.next.lver.orig, %.ph.lver.orig ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, 0xC09F400000000001
  %18 = fadd double %17, 0x40AF420000000001
  %19 = fdiv double 0x409F400000000001, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.lver.orig
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %13
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %27, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %14
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %31, %34
  %36 = fdiv double %35, %18
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond50.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond50.lver.orig, label %.lr.ph7.new.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep66 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep66, align 8
  %load_initial68 = load double, double* %scevgep67, align 8
  br label %38

; <label>:38:                                     ; preds = %38, %.ph
  %store_forwarded69 = phi double [ %load_initial68, %.ph ], [ %56, %38 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %41, %38 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %38 ]
  %39 = fmul double %store_forwarded, 0xC09F400000000001
  %40 = fadd double %39, 0x40AF420000000001
  %41 = fdiv double 0x409F400000000001, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv
  store double %41, double* %42, align 8
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %47 = extractelement <2 x double> %46, i32 0
  %48 = extractelement <2 x double> %46, i32 1
  %49 = fsub double %48, %47
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %13
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 0xC08F400000000001
  %53 = fsub double %49, %52
  %54 = fmul double %store_forwarded69, 0xC09F400000000001
  %55 = fsub double %53, %54
  %56 = fdiv double %55, %40
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv
  store double %56, double* %57, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond50, label %.lr.ph7.new.preheader.loopexit3, label %38

.lr.ph7.new.preheader.loopexit:                   ; preds = %.ph.lver.orig
  br label %.lr.ph7.new.preheader

.lr.ph7.new.preheader.loopexit3:                  ; preds = %38
  br label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.lr.ph7.new.preheader.loopexit3, %.lr.ph7.new.preheader.loopexit
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv31
  store double 1.000000e+00, double* %58, align 8
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new..lr.ph7.new_crit_edge, %.lr.ph7.new.preheader
  %59 = phi double [ %72, %.lr.ph7.new..lr.ph7.new_crit_edge ], [ 1.000000e+00, %.lr.ph7.new.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.lr.ph7.new..lr.ph7.new_crit_edge ], [ 998, %.lr.ph7.new.preheader ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv29
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %59
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv29
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv31
  store double %65, double* %66, align 8
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, -1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.next30
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %65
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.next30
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next30, i64 %indvars.iv31
  store double %72, double* %73, align 8
  %74 = icmp sgt i64 %indvars.iv.next30, 1
  br i1 %74, label %.lr.ph7.new..lr.ph7.new_crit_edge, label %._crit_edge8

.lr.ph7.new..lr.ph7.new_crit_edge:                ; preds = %.lr.ph7.new
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, -2
  br label %.lr.ph7.new

._crit_edge8:                                     ; preds = %.lr.ph7.new
  %exitcond = icmp eq i64 %13, 999
  br i1 %exitcond, label %._crit_edge8..lver.check84_crit_edge, label %._crit_edge8..lver.check_crit_edge

._crit_edge8..lver.check_crit_edge:               ; preds = %._crit_edge8
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %.lver.check

._crit_edge8..lver.check84_crit_edge:             ; preds = %._crit_edge8
  br label %.lver.check84

.lver.check84:                                    ; preds = %._crit_edge20..lver.check84_crit_edge, %._crit_edge8..lver.check84_crit_edge
  %indvar70 = phi i64 [ %indvar.next71, %._crit_edge20..lver.check84_crit_edge ], [ 0, %._crit_edge8..lver.check84_crit_edge ]
  %indvars.iv45 = phi i64 [ %84, %._crit_edge20..lver.check84_crit_edge ], [ 1, %._crit_edge8..lver.check84_crit_edge ]
  %75 = add nuw nsw i64 %indvar70, 1
  %76 = add nuw nsw i64 %indvar70, 1
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %2, i64 %76, i64 0
  %scevgep74 = getelementptr [1000 x double], [1000 x double]* %2, i64 %76, i64 999
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %3, i64 %76, i64 0
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %3, i64 %76, i64 999
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv45, i64 0
  store double 1.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 0
  store double 0.000000e+00, double* %78, align 8
  %79 = bitcast double* %77 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45
  %82 = bitcast [1000 x double]* %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = add nsw i64 %indvars.iv45, -1
  %84 = add nuw nsw i64 %indvars.iv45, 1
  %bound080 = icmp ult double* %scevgep72, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %.lver.check84..ph85.lver.orig_crit_edge, label %.ph85

.lver.check84..ph85.lver.orig_crit_edge:          ; preds = %.lver.check84
  br label %.ph85.lver.orig

.ph85.lver.orig:                                  ; preds = %.ph85.lver.orig, %.lver.check84..ph85.lver.orig_crit_edge
  %indvars.iv35.lver.orig = phi i64 [ 1, %.lver.check84..ph85.lver.orig_crit_edge ], [ %indvars.iv.next36.lver.orig, %.ph85.lver.orig ]
  %85 = add nsw i64 %indvars.iv35.lver.orig, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, 0xC08F400000000001
  %89 = fadd double %88, 0x409F440000000001
  %90 = fdiv double 0x408F400000000001, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv35.lver.orig
  store double %90, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv35.lver.orig
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC09F400000000001
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv35.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC0AF3E0000000001
  %98 = fsub double %97, %94
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv35.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %98, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %85
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %102, %105
  %107 = fdiv double %106, %89
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv35.lver.orig
  store double %107, double* %108, align 8
  %indvars.iv.next36.lver.orig = add nuw nsw i64 %indvars.iv35.lver.orig, 1
  %exitcond51.lver.orig = icmp eq i64 %indvars.iv.next36.lver.orig, 999
  br i1 %exitcond51.lver.orig, label %.lr.ph19.new.preheader.loopexit, label %.ph85.lver.orig

.ph85:                                            ; preds = %.lver.check84
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %load_initial87 = load double, double* %scevgep86, align 8
  %load_initial90 = load double, double* %scevgep89, align 8
  br label %109

; <label>:109:                                    ; preds = %109, %.ph85
  %store_forwarded91 = phi double [ %load_initial90, %.ph85 ], [ %127, %109 ]
  %store_forwarded88 = phi double [ %load_initial87, %.ph85 ], [ %112, %109 ]
  %indvars.iv35 = phi i64 [ 1, %.ph85 ], [ %indvars.iv.next36, %109 ]
  %110 = fmul double %store_forwarded88, 0xC08F400000000001
  %111 = fadd double %110, 0x409F440000000001
  %112 = fdiv double 0x408F400000000001, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv35
  store double %112, double* %113, align 8
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv35
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, 0xC09F400000000001
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv35
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 0xC0AF3E0000000001
  %120 = fsub double %119, %116
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv35
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 0xC09F400000000001
  %124 = fsub double %120, %123
  %125 = fmul double %store_forwarded91, 0xC08F400000000001
  %126 = fsub double %124, %125
  %127 = fdiv double %126, %111
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv35
  store double %127, double* %128, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next36, 999
  br i1 %exitcond51, label %.lr.ph19.new.preheader.loopexit2, label %109

.lr.ph19.new.preheader.loopexit:                  ; preds = %.ph85.lver.orig
  br label %.lr.ph19.new.preheader

.lr.ph19.new.preheader.loopexit2:                 ; preds = %109
  br label %.lr.ph19.new.preheader

.lr.ph19.new.preheader:                           ; preds = %.lr.ph19.new.preheader.loopexit2, %.lr.ph19.new.preheader.loopexit
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv45, i64 999
  store double 1.000000e+00, double* %129, align 8
  br label %.lr.ph19.new

.lr.ph19.new:                                     ; preds = %.lr.ph19.new..lr.ph19.new_crit_edge, %.lr.ph19.new.preheader
  %130 = phi double [ %143, %.lr.ph19.new..lr.ph19.new_crit_edge ], [ 1.000000e+00, %.lr.ph19.new.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %.lr.ph19.new..lr.ph19.new_crit_edge ], [ 998, %.lr.ph19.new.preheader ]
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv39
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %130
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv39
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv39
  store double %136, double* %137, align 8
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, -1
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv.next40
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %136
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv.next40
  %142 = load double, double* %141, align 8
  %143 = fadd double %140, %142
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next40
  store double %143, double* %144, align 8
  %145 = icmp sgt i64 %indvars.iv.next40, 1
  br i1 %145, label %.lr.ph19.new..lr.ph19.new_crit_edge, label %._crit_edge20

.lr.ph19.new..lr.ph19.new_crit_edge:              ; preds = %.lr.ph19.new
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, -2
  br label %.lr.ph19.new

._crit_edge20:                                    ; preds = %.lr.ph19.new
  %exitcond52 = icmp eq i64 %84, 999
  br i1 %exitcond52, label %._crit_edge24, label %._crit_edge20..lver.check84_crit_edge

._crit_edge20..lver.check84_crit_edge:            ; preds = %._crit_edge20
  %indvar.next71 = add nuw nsw i64 %indvar70, 1
  br label %.lver.check84

._crit_edge24:                                    ; preds = %._crit_edge20
  %exitcond49 = icmp eq i32 %.0325, 500
  br i1 %exitcond49, label %._crit_edge28, label %._crit_edge24..lr.ph11.preheader_crit_edge

._crit_edge24..lr.ph11.preheader_crit_edge:       ; preds = %._crit_edge24
  %146 = add nuw nsw i32 %.0325, 1
  br label %.lr.ph11.preheader

._crit_edge28:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond7, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
