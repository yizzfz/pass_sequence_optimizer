; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %._crit_edge1, %._crit_edge, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph21.preheader, label %.loopexit28.thread

.lr.ph21.preheader:                               ; preds = %5
  br i1 true, label %.lr.ph21.preheader..lr.ph21.prol.loopexit_crit_edge, label %.lr.ph21.prol

.lr.ph21.preheader..lr.ph21.prol.loopexit_crit_edge: ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol:                                    ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.preheader..lr.ph21.prol.loopexit_crit_edge, %.lr.ph21.prol
  %indvars.iv83.unr = phi i64 [ 0, %.lr.ph21.preheader..lr.ph21.prol.loopexit_crit_edge ], [ 1, %.lr.ph21.prol ]
  br i1 false, label %.lr.ph21.prol.loopexit..preheader6.preheader_crit_edge, label %.lr.ph21.preheader93

.lr.ph21.prol.loopexit..preheader6.preheader_crit_edge: ; preds = %.lr.ph21.prol.loopexit
  br label %.preheader6.preheader

.lr.ph21.preheader93:                             ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.preheader6.preheader.loopexit:                   ; preds = %.lr.ph21
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.lr.ph21.prol.loopexit..preheader6.preheader_crit_edge, %.preheader6.preheader.loopexit
  br label %.lr.ph14

.lr.ph21:                                         ; preds = %.lr.ph21..lr.ph21_crit_edge, %.lr.ph21.preheader93
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.lr.ph21..lr.ph21_crit_edge ], [ %indvars.iv83.unr, %.lr.ph21.preheader93 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv83
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv83
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %10 = trunc i64 %indvars.iv.next84 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv83
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %13 = trunc i64 %indvars.iv.next84.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, 2000
  br i1 %exitcond86.1, label %.preheader6.preheader.loopexit, label %.lr.ph21..lr.ph21_crit_edge

.lr.ph21..lr.ph21_crit_edge:                      ; preds = %.lr.ph21
  br label %.lr.ph21

.lr.ph14:                                         ; preds = %.loopexit26..lr.ph14_crit_edge, %.preheader6.preheader
  %indvars.iv79 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next80, %.loopexit26..lr.ph14_crit_edge ]
  %indvars.iv77 = phi i64 [ 1, %.preheader6.preheader ], [ %indvars.iv.next78, %.loopexit26..lr.ph14_crit_edge ]
  %21 = mul nuw nsw i64 %indvars.iv79, 2001
  %22 = add nuw nsw i64 %21, 1
  %scevgep73 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %22
  %scevgep7374 = bitcast double* %scevgep73 to i8*
  %23 = sub i64 1998, %indvars.iv79
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %27

; <label>:27:                                     ; preds = %._crit_edge, %.lr.ph14
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge ], [ 0, %.lr.ph14 ]
  %28 = sub nsw i64 0, %indvars.iv59
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv59
  store double %33, double* %34, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next60, %indvars.iv77
  br i1 %exitcond66, label %.loopexit27, label %._crit_edge

._crit_edge:                                      ; preds = %27
  br label %27

.loopexit27:                                      ; preds = %27
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %35 = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %35, label %.loopexit26.loopexit, label %.loopexit27..loopexit26_crit_edge

.loopexit27..loopexit26_crit_edge:                ; preds = %.loopexit27
  br label %.loopexit26

.loopexit26.loopexit:                             ; preds = %.loopexit27
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7374, i8 0, i64 %26, i32 8, i1 false)
  br label %.loopexit26

.loopexit26:                                      ; preds = %.loopexit27..loopexit26_crit_edge, %.loopexit26.loopexit
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv79
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond82, label %.loopexit28, label %.loopexit26..lr.ph14_crit_edge

.loopexit26..lr.ph14_crit_edge:                   ; preds = %.loopexit26
  br label %.lr.ph14

.loopexit28.thread:                               ; preds = %5
  br label %.loopexit22

.loopexit28:                                      ; preds = %.loopexit26
  %37 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 true, label %.loopexit28..preheader5.us.prol.loopexit_crit_edge, label %.loopexit25.us.prol.preheader

.loopexit28..preheader5.us.prol.loopexit_crit_edge: ; preds = %.loopexit28
  br label %.preheader5.us.prol.loopexit

.loopexit25.us.prol.preheader:                    ; preds = %.loopexit28
  br label %.loopexit25.us.prol

.loopexit25.us.prol:                              ; preds = %.loopexit25.us.prol..loopexit25.us.prol_crit_edge, %.loopexit25.us.prol.preheader
  br i1 true, label %.preheader5.us.prol.loopexit.loopexit, label %.loopexit25.us.prol..loopexit25.us.prol_crit_edge, !llvm.loop !1

.loopexit25.us.prol..loopexit25.us.prol_crit_edge: ; preds = %.loopexit25.us.prol
  br label %.loopexit25.us.prol

.preheader5.us.prol.loopexit.loopexit:            ; preds = %.loopexit25.us.prol
  br label %.preheader5.us.prol.loopexit

.preheader5.us.prol.loopexit:                     ; preds = %.loopexit28..preheader5.us.prol.loopexit_crit_edge, %.preheader5.us.prol.loopexit.loopexit
  br i1 false, label %.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge, label %.loopexit25.us.3.preheader

.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge: ; preds = %.preheader5.us.prol.loopexit
  br label %.preheader3.lr.ph.split.us

.loopexit25.us.3.preheader:                       ; preds = %.preheader5.us.prol.loopexit
  br i1 false, label %.loopexit25.us.3.prol.preheader, label %.loopexit25.us.3.preheader..loopexit25.us.3.prol.loopexit_crit_edge

.loopexit25.us.3.preheader..loopexit25.us.3.prol.loopexit_crit_edge: ; preds = %.loopexit25.us.3.preheader
  br label %.loopexit25.us.3.prol.loopexit

.loopexit25.us.3.prol.preheader:                  ; preds = %.loopexit25.us.3.preheader
  br label %.loopexit25.us.3.prol

.loopexit25.us.3.prol:                            ; preds = %.loopexit25.us.3.prol.preheader
  br label %.loopexit25.us.3.prol.loopexit

.loopexit25.us.3.prol.loopexit:                   ; preds = %.loopexit25.us.3.preheader..loopexit25.us.3.prol.loopexit_crit_edge, %.loopexit25.us.3.prol
  %indvar50.unr96 = phi i64 [ 0, %.loopexit25.us.3.preheader..loopexit25.us.3.prol.loopexit_crit_edge ], [ 4, %.loopexit25.us.3.prol ]
  br i1 false, label %.loopexit25.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge, label %.loopexit25.us.3.preheader.new

.loopexit25.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge: ; preds = %.loopexit25.us.3.prol.loopexit
  br label %.preheader3.lr.ph.split.us.loopexit

.loopexit25.us.3.preheader.new:                   ; preds = %.loopexit25.us.3.prol.loopexit
  br label %.loopexit25.us.3

.preheader3.lr.ph.split.us.loopexit.unr-lcssa:    ; preds = %.loopexit25.us.3
  br label %.preheader3.lr.ph.split.us.loopexit

.preheader3.lr.ph.split.us.loopexit:              ; preds = %.loopexit25.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge, %.preheader3.lr.ph.split.us.loopexit.unr-lcssa
  br label %.preheader3.lr.ph.split.us

.preheader3.lr.ph.split.us:                       ; preds = %.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge, %.preheader3.lr.ph.split.us.loopexit
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %.loopexit24.us..preheader2.us.us.preheader_crit_edge, %.preheader3.lr.ph.split.us
  %39 = phi i32 [ 0, %.preheader3.lr.ph.split.us ], [ %41, %.loopexit24.us..preheader2.us.us.preheader_crit_edge ]
  %40 = sext i32 %39 to i64
  br label %.preheader2.us.us

.loopexit24.us:                                   ; preds = %.loopexit23.us.us
  %41 = add nsw i32 %39, 1
  %42 = icmp slt i32 %41, 2000
  br i1 %42, label %.loopexit24.us..preheader2.us.us.preheader_crit_edge, label %.preheader.us.preheader

.loopexit24.us..preheader2.us.us.preheader_crit_edge: ; preds = %.loopexit24.us
  br label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %.loopexit24.us
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %.loopexit23.us.us..preheader2.us.us_crit_edge, %.preheader2.us.us.preheader
  %43 = phi i32 [ %46, %.loopexit23.us.us..preheader2.us.us_crit_edge ], [ 0, %.preheader2.us.us.preheader ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %44, i64 %40
  br i1 true, label %.preheader2.us.us..prol.loopexit45_crit_edge, label %.prol.preheader44

.preheader2.us.us..prol.loopexit45_crit_edge:     ; preds = %.preheader2.us.us
  br label %.prol.loopexit45

.prol.preheader44:                                ; preds = %.preheader2.us.us
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.preheader2.us.us..prol.loopexit45_crit_edge, %.prol.preheader44
  %indvars.iv40.unr.ph = phi i64 [ 1, %.prol.preheader44 ], [ 0, %.preheader2.us.us..prol.loopexit45_crit_edge ]
  br i1 false, label %.prol.loopexit45..loopexit23.us.us_crit_edge, label %.preheader2.us.us.new.preheader

.prol.loopexit45..loopexit23.us.us_crit_edge:     ; preds = %.prol.loopexit45
  br label %.loopexit23.us.us

.preheader2.us.us.new.preheader:                  ; preds = %.prol.loopexit45
  br label %.preheader2.us.us.new

.loopexit23.us.us.loopexit:                       ; preds = %.preheader2.us.us.new
  br label %.loopexit23.us.us

.loopexit23.us.us:                                ; preds = %.prol.loopexit45..loopexit23.us.us_crit_edge, %.loopexit23.us.us.loopexit
  %46 = add nsw i32 %43, 1
  %47 = icmp slt i32 %46, 2000
  br i1 %47, label %.loopexit23.us.us..preheader2.us.us_crit_edge, label %.loopexit24.us

.loopexit23.us.us..preheader2.us.us_crit_edge:    ; preds = %.loopexit23.us.us
  br label %.preheader2.us.us

.preheader2.us.us.new:                            ; preds = %.preheader2.us.us.new..preheader2.us.us.new_crit_edge, %.preheader2.us.us.new.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %.preheader2.us.us.new..preheader2.us.us.new_crit_edge ], [ %indvars.iv40.unr.ph, %.preheader2.us.us.new.preheader ]
  %48 = load double, double* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv40, i64 %40
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %44, i64 %indvars.iv40
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %55 = load double, double* %45, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next41, i64 %40
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %44, i64 %indvars.iv.next41
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, 2000
  br i1 %exitcond43.1, label %.loopexit23.us.us.loopexit, label %.preheader2.us.us.new..preheader2.us.us.new_crit_edge

.preheader2.us.us.new..preheader2.us.us.new_crit_edge: ; preds = %.preheader2.us.us.new
  br label %.preheader2.us.us.new

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %62 = phi i64 [ %84, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %sext = shl i64 %62, 32
  %63 = ashr exact i64 %sext, 32
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  br i1 true, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  br i1 false, label %.prol.loopexit..loopexit.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit..loopexit.us_crit_edge:            ; preds = %.prol.loopexit
  br label %.loopexit.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ 0, %.preheader.us.new.preheader ]
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %63, i64 %indvars.iv
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %63, i64 %indvars.iv
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %63, i64 %indvars.iv.next
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %63, i64 %indvars.iv.next
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %63, i64 %indvars.iv.next.1
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %63, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %63, i64 %indvars.iv.next.2
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %63, i64 %indvars.iv.next.2
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond37.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond37.3, label %.loopexit.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

.loopexit.us.loopexit:                            ; preds = %.preheader.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.prol.loopexit..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %84 = add nsw i64 %63, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond39 = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond39, label %.loopexit22.loopexit, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit22.loopexit:                             ; preds = %.loopexit.us
  br label %.loopexit22

.loopexit22:                                      ; preds = %.loopexit22.loopexit, %.loopexit28.thread
  %85 = phi i8* [ undef, %.loopexit28.thread ], [ %37, %.loopexit22.loopexit ]
  call void @free(i8* %85) #4
  ret void

.loopexit25.us.3:                                 ; preds = %.loopexit25.us.3..loopexit25.us.3_crit_edge, %.loopexit25.us.3.preheader.new
  %indvar50 = phi i64 [ %indvar50.unr96, %.loopexit25.us.3.preheader.new ], [ %indvar.next51.3.1, %.loopexit25.us.3..loopexit25.us.3_crit_edge ]
  %86 = mul i64 %indvar50, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %86
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %87 = add i64 %86, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %88 = add i64 %86, 32000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %88
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %89 = add i64 %86, 48000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %90 = mul i64 %indvar50, 16000
  %91 = add i64 %90, 64000
  %scevgep.197 = getelementptr i8, i8* %37, i64 %91
  call void @llvm.memset.p0i8.i64(i8* %scevgep.197, i8 0, i64 16000, i32 8, i1 false)
  %92 = add i64 %90, 80000
  %scevgep.1.1 = getelementptr i8, i8* %37, i64 %92
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %93 = add i64 %90, 96000
  %scevgep.2.1 = getelementptr i8, i8* %37, i64 %93
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %94 = add i64 %90, 112000
  %scevgep.3.1 = getelementptr i8, i8* %37, i64 %94
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next51.3.1 = add nsw i64 %indvar50, 8
  %exitcond55.3.1 = icmp eq i64 %indvar.next51.3.1, 2000
  br i1 %exitcond55.3.1, label %.preheader3.lr.ph.split.us.loopexit.unr-lcssa, label %.loopexit25.us.3..loopexit25.us.3_crit_edge

.loopexit25.us.3..loopexit25.us.3_crit_edge:      ; preds = %.loopexit25.us.3
  br label %.loopexit25.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader3.preheader, label %..loopexit26_crit_edge

..loopexit26_crit_edge:                           ; preds = %5
  br label %.loopexit26

.preheader3.preheader:                            ; preds = %5
  br label %.preheader3

.preheader3:                                      ; preds = %.loopexit30..preheader3_crit_edge, %.preheader3.preheader
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %.loopexit30..preheader3_crit_edge ], [ 0, %.preheader3.preheader ]
  %6 = add i64 %indvars.iv89, 4294967295
  %7 = icmp sgt i64 %indvars.iv89, 0
  br i1 %7, label %.lr.ph19.preheader, label %.preheader3..loopexit30_crit_edge

.preheader3..loopexit30_crit_edge:                ; preds = %.preheader3
  br label %.loopexit30

.lr.ph19.preheader:                               ; preds = %.preheader3
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 0
  br label %.lr.ph19

.lr.ph24.split.us.preheader:                      ; preds = %.loopexit29
  %9 = trunc i64 %indvars.iv89 to i32
  %xtraiter8494 = and i64 %indvars.iv89, 1
  %lcmp.mod85 = icmp eq i64 %xtraiter8494, 0
  %10 = trunc i64 %6 to i32
  %11 = icmp eq i32 %10, 0
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %.loopexit28.us..lr.ph24.split.us_crit_edge, %.lr.ph24.split.us.preheader
  %12 = phi i32 [ %36, %.loopexit28.us..lr.ph24.split.us_crit_edge ], [ %9, %.lr.ph24.split.us.preheader ]
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %13
  %15 = load double, double* %14, align 8
  br i1 %lcmp.mod85, label %.lr.ph24.split.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph24.split.us..prol.loopexit_crit_edge:       ; preds = %.lr.ph24.split.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph24.split.us
  %16 = load double, double* %8, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %13
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %15, %19
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph24.split.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv75.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph24.split.us..prol.loopexit_crit_edge ]
  %.unr86.ph = phi double [ %20, %.prol.preheader ], [ %15, %.lr.ph24.split.us..prol.loopexit_crit_edge ]
  %.lcssa44.unr.ph = phi double [ %20, %.prol.preheader ], [ undef, %.lr.ph24.split.us..prol.loopexit_crit_edge ]
  br i1 %11, label %.prol.loopexit..loopexit28.us_crit_edge, label %.lr.ph24.split.us.new.preheader

.prol.loopexit..loopexit28.us_crit_edge:          ; preds = %.prol.loopexit
  br label %.loopexit28.us

.lr.ph24.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph24.split.us.new

.lr.ph24.split.us.new:                            ; preds = %.lr.ph24.split.us.new..lr.ph24.split.us.new_crit_edge, %.lr.ph24.split.us.new.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76.1, %.lr.ph24.split.us.new..lr.ph24.split.us.new_crit_edge ], [ %indvars.iv75.unr.ph, %.lr.ph24.split.us.new.preheader ]
  %21 = phi double [ %35, %.lr.ph24.split.us.new..lr.ph24.split.us.new_crit_edge ], [ %.unr86.ph, %.lr.ph24.split.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv75
  %23 = bitcast double* %22 to <2 x double>*
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75, i64 %13
  %25 = load double, double* %24, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %26 = load <2 x double>, <2 x double>* %23, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next76, i64 %13
  %28 = load double, double* %27, align 8
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %26, %30
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fsub double %21, %32
  %35 = fsub double %34, %33
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next76.1, %indvars.iv89
  br i1 %exitcond83.1, label %.loopexit28.us.loopexit, label %.lr.ph24.split.us.new..lr.ph24.split.us.new_crit_edge

.lr.ph24.split.us.new..lr.ph24.split.us.new_crit_edge: ; preds = %.lr.ph24.split.us.new
  br label %.lr.ph24.split.us.new

.loopexit28.us.loopexit:                          ; preds = %.lr.ph24.split.us.new
  br label %.loopexit28.us

.loopexit28.us:                                   ; preds = %.prol.loopexit..loopexit28.us_crit_edge, %.loopexit28.us.loopexit
  %.lcssa44 = phi double [ %.lcssa44.unr.ph, %.prol.loopexit..loopexit28.us_crit_edge ], [ %35, %.loopexit28.us.loopexit ]
  store double %.lcssa44, double* %14, align 8
  %36 = add nsw i32 %12, 1
  %37 = icmp slt i32 %36, 2000
  br i1 %37, label %.loopexit28.us..lr.ph24.split.us_crit_edge, label %.loopexit30.loopexit

.loopexit28.us..lr.ph24.split.us_crit_edge:       ; preds = %.loopexit28.us
  br label %.lr.ph24.split.us

.lr.ph19:                                         ; preds = %.loopexit29..lr.ph19_crit_edge, %.lr.ph19.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %.loopexit29..lr.ph19_crit_edge ], [ 0, %.lr.ph19.preheader ]
  %38 = add i64 %indvars.iv72, 4294967295
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv72
  %40 = load double, double* %39, align 8
  %41 = icmp sgt i64 %indvars.iv72, 0
  br i1 %41, label %.lr.ph16.preheader, label %.lr.ph19..loopexit29_crit_edge

.lr.ph19..loopexit29_crit_edge:                   ; preds = %.lr.ph19
  br label %.loopexit29

.lr.ph16.preheader:                               ; preds = %.lr.ph19
  %xtraiter6695 = and i64 %indvars.iv72, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter6695, 0
  br i1 %lcmp.mod67, label %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge, label %.lr.ph16.prol

.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge: ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol:                                    ; preds = %.lr.ph16.preheader
  %42 = load double, double* %8, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv72
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge, %.lr.ph16.prol
  %indvars.iv59.unr.ph = phi i64 [ 1, %.lr.ph16.prol ], [ 0, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ]
  %.unr68.ph = phi double [ %46, %.lr.ph16.prol ], [ %40, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ]
  %.lcssa43.unr.ph = phi double [ %46, %.lr.ph16.prol ], [ undef, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ]
  %47 = trunc i64 %38 to i32
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %.lr.ph16.prol.loopexit..loopexit29_crit_edge, label %.lr.ph16.preheader122

.lr.ph16.prol.loopexit..loopexit29_crit_edge:     ; preds = %.lr.ph16.prol.loopexit
  br label %.loopexit29

.lr.ph16.preheader122:                            ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16..lr.ph16_crit_edge, %.lr.ph16.preheader122
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %.lr.ph16..lr.ph16_crit_edge ], [ %indvars.iv59.unr.ph, %.lr.ph16.preheader122 ]
  %49 = phi double [ %63, %.lr.ph16..lr.ph16_crit_edge ], [ %.unr68.ph, %.lr.ph16.preheader122 ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv59
  %51 = bitcast double* %50 to <2 x double>*
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv72
  %53 = load double, double* %52, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %54 = load <2 x double>, <2 x double>* %51, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next60, i64 %indvars.iv72
  %56 = load double, double* %55, align 8
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  %59 = fmul <2 x double> %54, %58
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %62 = fsub double %49, %60
  %63 = fsub double %62, %61
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next60.1, %indvars.iv72
  br i1 %exitcond63.1, label %.loopexit29.loopexit, label %.lr.ph16..lr.ph16_crit_edge

.lr.ph16..lr.ph16_crit_edge:                      ; preds = %.lr.ph16
  br label %.lr.ph16

.loopexit29.loopexit:                             ; preds = %.lr.ph16
  br label %.loopexit29

.loopexit29:                                      ; preds = %.lr.ph16.prol.loopexit..loopexit29_crit_edge, %.lr.ph19..loopexit29_crit_edge, %.loopexit29.loopexit
  %.lcssa5 = phi double [ %40, %.lr.ph19..loopexit29_crit_edge ], [ %.lcssa43.unr.ph, %.lr.ph16.prol.loopexit..loopexit29_crit_edge ], [ %63, %.loopexit29.loopexit ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %65 = load double, double* %64, align 8
  %66 = fdiv double %.lcssa5, %65
  store double %66, double* %39, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next73, %indvars.iv89
  br i1 %exitcond71, label %.lr.ph24.split.us.preheader, label %.loopexit29..lr.ph19_crit_edge

.loopexit29..lr.ph19_crit_edge:                   ; preds = %.loopexit29
  br label %.lr.ph19

.loopexit30.loopexit:                             ; preds = %.loopexit28.us
  br label %.loopexit30

.loopexit30:                                      ; preds = %.preheader3..loopexit30_crit_edge, %.loopexit30.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond93, label %.lr.ph14.preheader, label %.loopexit30..preheader3_crit_edge

.loopexit30..preheader3_crit_edge:                ; preds = %.loopexit30
  br label %.preheader3

.lr.ph14.preheader:                               ; preds = %.loopexit30
  br label %.lr.ph14

.lr.ph8.preheader:                                ; preds = %.loopexit27
  br label %.lr.ph8

.lr.ph14:                                         ; preds = %.loopexit27..lr.ph14_crit_edge, %.lr.ph14.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.loopexit27..lr.ph14_crit_edge ], [ 0, %.lr.ph14.preheader ]
  %67 = add i64 %indvars.iv57, 4294967295
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv57
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv57, 0
  br i1 %70, label %.lr.ph11.preheader, label %.lr.ph14..loopexit27_crit_edge

.lr.ph14..loopexit27_crit_edge:                   ; preds = %.lr.ph14
  br label %.loopexit27

.lr.ph11.preheader:                               ; preds = %.lr.ph14
  %71 = trunc i64 %indvars.iv57 to i32
  %xtraiter53 = and i32 %71, 3
  %lcmp.mod54 = icmp eq i32 %xtraiter53, 0
  br i1 %lcmp.mod54, label %.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge, label %.lr.ph11.prol.preheader

.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge: ; preds = %.lr.ph11.preheader
  br label %.lr.ph11.prol.loopexit

.lr.ph11.prol.preheader:                          ; preds = %.lr.ph11.preheader
  br label %.lr.ph11.prol

.lr.ph11.prol:                                    ; preds = %.lr.ph11.prol..lr.ph11.prol_crit_edge, %.lr.ph11.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph11.prol..lr.ph11.prol_crit_edge ], [ 0, %.lr.ph11.prol.preheader ]
  %72 = phi double [ %78, %.lr.ph11.prol..lr.ph11.prol_crit_edge ], [ %69, %.lr.ph11.prol.preheader ]
  %prol.iter55 = phi i32 [ %prol.iter55.sub, %.lr.ph11.prol..lr.ph11.prol_crit_edge ], [ %xtraiter53, %.lr.ph11.prol.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fsub double %72, %77
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter55.sub = add i32 %prol.iter55, -1
  %prol.iter55.cmp = icmp eq i32 %prol.iter55.sub, 0
  br i1 %prol.iter55.cmp, label %.lr.ph11.prol.loopexit.loopexit, label %.lr.ph11.prol..lr.ph11.prol_crit_edge, !llvm.loop !4

.lr.ph11.prol..lr.ph11.prol_crit_edge:            ; preds = %.lr.ph11.prol
  br label %.lr.ph11.prol

.lr.ph11.prol.loopexit.loopexit:                  ; preds = %.lr.ph11.prol
  br label %.lr.ph11.prol.loopexit

.lr.ph11.prol.loopexit:                           ; preds = %.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge, %.lr.ph11.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph11.prol.loopexit.loopexit ]
  %.unr56 = phi double [ %69, %.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge ], [ %78, %.lr.ph11.prol.loopexit.loopexit ]
  %.lcssa42.unr = phi double [ undef, %.lr.ph11.preheader..lr.ph11.prol.loopexit_crit_edge ], [ %78, %.lr.ph11.prol.loopexit.loopexit ]
  %79 = trunc i64 %67 to i32
  %80 = icmp ult i32 %79, 3
  br i1 %80, label %.lr.ph11.prol.loopexit..loopexit27_crit_edge, label %.lr.ph11.preheader121

.lr.ph11.prol.loopexit..loopexit27_crit_edge:     ; preds = %.lr.ph11.prol.loopexit
  br label %.loopexit27

.lr.ph11.preheader121:                            ; preds = %.lr.ph11.prol.loopexit
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11..lr.ph11_crit_edge, %.lr.ph11.preheader121
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph11..lr.ph11_crit_edge ], [ %indvars.iv.unr, %.lr.ph11.preheader121 ]
  %81 = phi double [ %103, %.lr.ph11..lr.ph11_crit_edge ], [ %.unr56, %.lr.ph11.preheader121 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %83, align 8
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = fmul <2 x double> %86, %87
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = fsub double %81, %89
  %92 = fsub double %91, %90
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to <2 x double>*
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond50.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv57
  br i1 %exitcond50.3, label %.loopexit27.loopexit, label %.lr.ph11..lr.ph11_crit_edge

.lr.ph11..lr.ph11_crit_edge:                      ; preds = %.lr.ph11
  br label %.lr.ph11

.loopexit27.loopexit:                             ; preds = %.lr.ph11
  br label %.loopexit27

.loopexit27:                                      ; preds = %.lr.ph11.prol.loopexit..loopexit27_crit_edge, %.lr.ph14..loopexit27_crit_edge, %.loopexit27.loopexit
  %.lcssa4 = phi double [ %69, %.lr.ph14..loopexit27_crit_edge ], [ %.lcssa42.unr, %.lr.ph11.prol.loopexit..loopexit27_crit_edge ], [ %103, %.loopexit27.loopexit ]
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv57
  store double %.lcssa4, double* %104, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond, label %.lr.ph8.preheader, label %.loopexit27..lr.ph14_crit_edge

.loopexit27..lr.ph14_crit_edge:                   ; preds = %.loopexit27
  br label %.lr.ph14

.lr.ph8:                                          ; preds = %.loopexit..lr.ph8_crit_edge, %.lr.ph8.preheader
  %indvars.iv47 = phi i64 [ 2000, %.lr.ph8.preheader ], [ %indvars.iv.next48, %.loopexit..lr.ph8_crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph8.preheader ], [ %indvar.next, %.loopexit..lr.ph8_crit_edge ]
  %.in = phi i32 [ 2000, %.lr.ph8.preheader ], [ %106, %.loopexit..lr.ph8_crit_edge ]
  %105 = add nsw i32 %indvar, -1
  %indvars.iv.next48 = add nsw i64 %indvars.iv47, -1
  %106 = add nsw i32 %.in, -1
  %107 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next48
  %108 = load double, double* %107, align 8
  %109 = icmp slt i32 %.in, 2000
  br i1 %109, label %.lr.ph.preheader, label %.lr.ph8..loopexit_crit_edge

.lr.ph8..loopexit_crit_edge:                      ; preds = %.lr.ph8
  br label %.loopexit

.lr.ph.preheader:                                 ; preds = %.lr.ph8
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol.preheader

.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge:  ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.prol.preheader
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %indvars.iv47, %.lr.ph.prol.preheader ]
  %110 = phi double [ %116, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %108, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv45.prol
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv45.prol
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fsub double %110, %115
  %indvars.iv.next46.prol = add nsw i64 %indvars.iv45.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !5

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, %.lr.ph.prol.loopexit.loopexit
  %indvars.iv45.unr = phi i64 [ %indvars.iv47, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %indvars.iv.next46.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.unr = phi double [ %108, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %116, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa41.unr = phi double [ undef, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %116, %.lr.ph.prol.loopexit.loopexit ]
  %117 = icmp ult i32 %105, 3
  br i1 %117, label %.lr.ph.prol.loopexit..loopexit_crit_edge, label %.lr.ph.preheader120

.lr.ph.prol.loopexit..loopexit_crit_edge:         ; preds = %.lr.ph.prol.loopexit
  br label %.loopexit

.lr.ph.preheader120:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader120
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.3, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv45.unr, %.lr.ph.preheader120 ]
  %118 = phi double [ %140, %.lr.ph..lr.ph_crit_edge ], [ %.unr, %.lr.ph.preheader120 ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv45
  %120 = bitcast double* %119 to <2 x double>*
  %121 = getelementptr inbounds double, double* %3, i64 %indvars.iv45
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %120, align 8
  %124 = load <2 x double>, <2 x double>* %122, align 8
  %125 = fmul <2 x double> %123, %124
  %126 = extractelement <2 x double> %125, i32 0
  %127 = extractelement <2 x double> %125, i32 1
  %128 = fsub double %118, %126
  %129 = fsub double %128, %127
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv.next46.1
  %131 = bitcast double* %130 to <2 x double>*
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next46.1
  %133 = bitcast double* %132 to <2 x double>*
  %134 = load <2 x double>, <2 x double>* %131, align 8
  %135 = load <2 x double>, <2 x double>* %133, align 8
  %136 = fmul <2 x double> %134, %135
  %137 = extractelement <2 x double> %136, i32 0
  %138 = extractelement <2 x double> %136, i32 1
  %139 = fsub double %129, %137
  %140 = fsub double %139, %138
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next46.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %.loopexit.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph.prol.loopexit..loopexit_crit_edge, %.lr.ph8..loopexit_crit_edge, %.loopexit.loopexit
  %.lcssa = phi double [ %108, %.lr.ph8..loopexit_crit_edge ], [ %.lcssa41.unr, %.lr.ph.prol.loopexit..loopexit_crit_edge ], [ %140, %.loopexit.loopexit ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv.next48
  %142 = load double, double* %141, align 8
  %143 = fdiv double %.lcssa, %142
  %144 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next48
  store double %143, double* %144, align 8
  %145 = icmp sgt i64 %indvars.iv47, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %145, label %.loopexit..lr.ph8_crit_edge, label %.loopexit26.loopexit

.loopexit..lr.ph8_crit_edge:                      ; preds = %.loopexit
  br label %.lr.ph8

.loopexit26.loopexit:                             ; preds = %.loopexit
  br label %.loopexit26

.loopexit26:                                      ; preds = %..loopexit26_crit_edge, %.loopexit26.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph.preheader, label %..loopexit_crit_edge

..loopexit_crit_edge:                             ; preds = %2
  br label %.loopexit

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %12

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %.lr.ph._crit_edge, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond2, label %.loopexit.loopexit, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %12
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %12
  br label %.loopexit

.loopexit:                                        ; preds = %..loopexit_crit_edge, %.loopexit.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
