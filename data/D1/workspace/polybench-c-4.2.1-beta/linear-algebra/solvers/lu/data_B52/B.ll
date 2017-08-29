; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge1

._crit_edge1:                                     ; preds = %6
  br label %10

; <label>:9:                                      ; preds = %6
  call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %._crit_edge1, %._crit_edge, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader6.lr.ph, label %.loopexit25.thread

.loopexit25.thread:                               ; preds = %2
  br label %.loopexit19

.preheader6.lr.ph:                                ; preds = %2
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.loopexit23..lr.ph13_crit_edge, %.preheader6.lr.ph
  %indvars.iv76 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next77, %.loopexit23..lr.ph13_crit_edge ]
  %indvars.iv74 = phi i64 [ 1, %.preheader6.lr.ph ], [ %indvars.iv.next75, %.loopexit23..lr.ph13_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv76, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep70 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %scevgep7071 = bitcast double* %scevgep70 to i8*
  %5 = sub i64 1998, %indvars.iv76
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  %8 = add nuw nsw i64 %7, 8
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph13
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 0, %.lr.ph13 ]
  %10 = sub nsw i64 0, %indvars.iv56
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv76, i64 %indvars.iv56
  store double %15, double* %16, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next57, %indvars.iv74
  br i1 %exitcond63, label %.loopexit24, label %._crit_edge

._crit_edge:                                      ; preds = %9
  br label %9

.loopexit24:                                      ; preds = %9
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %17 = icmp slt i64 %indvars.iv.next77, 2000
  br i1 %17, label %.loopexit23.loopexit, label %.loopexit24..loopexit23_crit_edge

.loopexit24..loopexit23_crit_edge:                ; preds = %.loopexit24
  br label %.loopexit23

.loopexit23.loopexit:                             ; preds = %.loopexit24
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7071, i8 0, i64 %8, i32 8, i1 false)
  br label %.loopexit23

.loopexit23:                                      ; preds = %.loopexit24..loopexit23_crit_edge, %.loopexit23.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %18, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, 2000
  br i1 %exitcond79, label %.loopexit25, label %.loopexit23..lr.ph13_crit_edge

.loopexit23..lr.ph13_crit_edge:                   ; preds = %.loopexit23
  br label %.lr.ph13

.loopexit25:                                      ; preds = %.loopexit23
  %19 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 true, label %.loopexit25..preheader5.us.prol.loopexit_crit_edge, label %.loopexit22.us.prol.preheader

.loopexit25..preheader5.us.prol.loopexit_crit_edge: ; preds = %.loopexit25
  br label %.preheader5.us.prol.loopexit

.loopexit22.us.prol.preheader:                    ; preds = %.loopexit25
  br label %.loopexit22.us.prol

.loopexit22.us.prol:                              ; preds = %.loopexit22.us.prol..loopexit22.us.prol_crit_edge, %.loopexit22.us.prol.preheader
  br i1 true, label %.preheader5.us.prol.loopexit.loopexit, label %.loopexit22.us.prol..loopexit22.us.prol_crit_edge, !llvm.loop !1

.loopexit22.us.prol..loopexit22.us.prol_crit_edge: ; preds = %.loopexit22.us.prol
  br label %.loopexit22.us.prol

.preheader5.us.prol.loopexit.loopexit:            ; preds = %.loopexit22.us.prol
  br label %.preheader5.us.prol.loopexit

.preheader5.us.prol.loopexit:                     ; preds = %.loopexit25..preheader5.us.prol.loopexit_crit_edge, %.preheader5.us.prol.loopexit.loopexit
  br i1 false, label %.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge, label %.loopexit22.us.3.preheader

.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge: ; preds = %.preheader5.us.prol.loopexit
  br label %.preheader3.lr.ph.split.us

.loopexit22.us.3.preheader:                       ; preds = %.preheader5.us.prol.loopexit
  br i1 false, label %.loopexit22.us.3.prol.preheader, label %.loopexit22.us.3.preheader..loopexit22.us.3.prol.loopexit_crit_edge

.loopexit22.us.3.preheader..loopexit22.us.3.prol.loopexit_crit_edge: ; preds = %.loopexit22.us.3.preheader
  br label %.loopexit22.us.3.prol.loopexit

.loopexit22.us.3.prol.preheader:                  ; preds = %.loopexit22.us.3.preheader
  br label %.loopexit22.us.3.prol

.loopexit22.us.3.prol:                            ; preds = %.loopexit22.us.3.prol.preheader
  br label %.loopexit22.us.3.prol.loopexit

.loopexit22.us.3.prol.loopexit:                   ; preds = %.loopexit22.us.3.preheader..loopexit22.us.3.prol.loopexit_crit_edge, %.loopexit22.us.3.prol
  %indvar47.unr84 = phi i64 [ 0, %.loopexit22.us.3.preheader..loopexit22.us.3.prol.loopexit_crit_edge ], [ 4, %.loopexit22.us.3.prol ]
  br i1 false, label %.loopexit22.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge, label %.loopexit22.us.3.preheader.new

.loopexit22.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge: ; preds = %.loopexit22.us.3.prol.loopexit
  br label %.preheader3.lr.ph.split.us.loopexit

.loopexit22.us.3.preheader.new:                   ; preds = %.loopexit22.us.3.prol.loopexit
  br label %.loopexit22.us.3

.preheader3.lr.ph.split.us.loopexit.unr-lcssa:    ; preds = %.loopexit22.us.3
  br label %.preheader3.lr.ph.split.us.loopexit

.preheader3.lr.ph.split.us.loopexit:              ; preds = %.loopexit22.us.3.prol.loopexit..preheader3.lr.ph.split.us.loopexit_crit_edge, %.preheader3.lr.ph.split.us.loopexit.unr-lcssa
  br label %.preheader3.lr.ph.split.us

.preheader3.lr.ph.split.us:                       ; preds = %.preheader5.us.prol.loopexit..preheader3.lr.ph.split.us_crit_edge, %.preheader3.lr.ph.split.us.loopexit
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %.loopexit21.us..preheader2.us.us.preheader_crit_edge, %.preheader3.lr.ph.split.us
  %21 = phi i32 [ 0, %.preheader3.lr.ph.split.us ], [ %23, %.loopexit21.us..preheader2.us.us.preheader_crit_edge ]
  %22 = sext i32 %21 to i64
  br label %.preheader2.us.us

.loopexit21.us:                                   ; preds = %.loopexit20.us.us
  %23 = add nsw i32 %21, 1
  %24 = icmp slt i32 %23, 2000
  br i1 %24, label %.loopexit21.us..preheader2.us.us.preheader_crit_edge, label %.preheader.us.preheader

.loopexit21.us..preheader2.us.us.preheader_crit_edge: ; preds = %.loopexit21.us
  br label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %.loopexit21.us
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %.loopexit20.us.us..preheader2.us.us_crit_edge, %.preheader2.us.us.preheader
  %25 = phi i32 [ %28, %.loopexit20.us.us..preheader2.us.us_crit_edge ], [ 0, %.preheader2.us.us.preheader ]
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %26, i64 %22
  br i1 true, label %.preheader2.us.us..prol.loopexit42_crit_edge, label %.prol.preheader41

.preheader2.us.us..prol.loopexit42_crit_edge:     ; preds = %.preheader2.us.us
  br label %.prol.loopexit42

.prol.preheader41:                                ; preds = %.preheader2.us.us
  br label %.prol.loopexit42

.prol.loopexit42:                                 ; preds = %.preheader2.us.us..prol.loopexit42_crit_edge, %.prol.preheader41
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader41 ], [ 0, %.preheader2.us.us..prol.loopexit42_crit_edge ]
  br i1 false, label %.prol.loopexit42..loopexit20.us.us_crit_edge, label %.preheader2.us.us.new.preheader

.prol.loopexit42..loopexit20.us.us_crit_edge:     ; preds = %.prol.loopexit42
  br label %.loopexit20.us.us

.preheader2.us.us.new.preheader:                  ; preds = %.prol.loopexit42
  br label %.preheader2.us.us.new

.loopexit20.us.us.loopexit:                       ; preds = %.preheader2.us.us.new
  br label %.loopexit20.us.us

.loopexit20.us.us:                                ; preds = %.prol.loopexit42..loopexit20.us.us_crit_edge, %.loopexit20.us.us.loopexit
  %28 = add nsw i32 %25, 1
  %29 = icmp slt i32 %28, 2000
  br i1 %29, label %.loopexit20.us.us..preheader2.us.us_crit_edge, label %.loopexit21.us

.loopexit20.us.us..preheader2.us.us_crit_edge:    ; preds = %.loopexit20.us.us
  br label %.preheader2.us.us

.preheader2.us.us.new:                            ; preds = %.preheader2.us.us.new..preheader2.us.us.new_crit_edge, %.preheader2.us.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.preheader2.us.us.new..preheader2.us.us.new_crit_edge ], [ %indvars.iv37.unr.ph, %.preheader2.us.us.new.preheader ]
  %30 = load double, double* %27, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv37, i64 %22
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %26, i64 %indvars.iv37
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %37 = load double, double* %27, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next38, i64 %22
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %26, i64 %indvars.iv.next38
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next38.1, 2000
  br i1 %exitcond40.1, label %.loopexit20.us.us.loopexit, label %.preheader2.us.us.new..preheader2.us.us.new_crit_edge

.preheader2.us.us.new..preheader2.us.us.new_crit_edge: ; preds = %.preheader2.us.us.new
  br label %.preheader2.us.us.new

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %44 = phi i64 [ %66, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %sext = shl i64 %44, 32
  %45 = ashr exact i64 %sext, 32
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
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %45, i64 %indvars.iv
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %45, i64 %indvars.iv
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %45, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %45, i64 %indvars.iv.next
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %45, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %45, i64 %indvars.iv.next.1
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %45, i64 %indvars.iv.next.2
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %45, i64 %indvars.iv.next.2
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond34.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond34.3, label %.loopexit.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

.loopexit.us.loopexit:                            ; preds = %.preheader.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.prol.loopexit..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %66 = add nsw i64 %45, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond36 = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond36, label %.loopexit19.loopexit, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit19.loopexit:                             ; preds = %.loopexit.us
  br label %.loopexit19

.loopexit19:                                      ; preds = %.loopexit19.loopexit, %.loopexit25.thread
  %67 = phi i8* [ undef, %.loopexit25.thread ], [ %19, %.loopexit19.loopexit ]
  call void @free(i8* %67) #4
  ret void

.loopexit22.us.3:                                 ; preds = %.loopexit22.us.3..loopexit22.us.3_crit_edge, %.loopexit22.us.3.preheader.new
  %indvar47 = phi i64 [ %indvar47.unr84, %.loopexit22.us.3.preheader.new ], [ %indvar.next48.3.1, %.loopexit22.us.3..loopexit22.us.3_crit_edge ]
  %68 = mul i64 %indvar47, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %69 = add i64 %68, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %69
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %70 = add i64 %68, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %71 = add i64 %68, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %71
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %72 = mul i64 %indvar47, 16000
  %73 = add i64 %72, 64000
  %scevgep.185 = getelementptr i8, i8* %19, i64 %73
  call void @llvm.memset.p0i8.i64(i8* %scevgep.185, i8 0, i64 16000, i32 8, i1 false)
  %74 = add i64 %72, 80000
  %scevgep.1.1 = getelementptr i8, i8* %19, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %75 = add i64 %72, 96000
  %scevgep.2.1 = getelementptr i8, i8* %19, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %76 = add i64 %72, 112000
  %scevgep.3.1 = getelementptr i8, i8* %19, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next48.3.1 = add nsw i64 %indvar47, 8
  %exitcond52.3.1 = icmp eq i64 %indvar.next48.3.1, 2000
  br i1 %exitcond52.3.1, label %.preheader3.lr.ph.split.us.loopexit.unr-lcssa, label %.loopexit22.us.3..loopexit22.us.3_crit_edge

.loopexit22.us.3..loopexit22.us.3_crit_edge:      ; preds = %.loopexit22.us.3
  br label %.loopexit22.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader3.preheader, label %..loopexit10_crit_edge

..loopexit10_crit_edge:                           ; preds = %2
  br label %.loopexit10

.preheader3.preheader:                            ; preds = %2
  br label %.preheader3

.preheader3:                                      ; preds = %.loopexit9..preheader3_crit_edge, %.preheader3.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %.loopexit9..preheader3_crit_edge ], [ 0, %.preheader3.preheader ]
  %3 = add i64 %indvars.iv43, 4294967295
  %4 = icmp sgt i64 %indvars.iv43, 0
  br i1 %4, label %.preheader1.preheader, label %.preheader3..loopexit9_crit_edge

.preheader3..loopexit9_crit_edge:                 ; preds = %.preheader3
  br label %.loopexit9

.preheader1.preheader:                            ; preds = %.preheader3
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 0
  br label %.preheader1

.preheader.us.preheader:                          ; preds = %.loopexit8
  %6 = trunc i64 %indvars.iv43 to i32
  %xtraiter3947 = and i64 %indvars.iv43, 1
  %lcmp.mod40 = icmp eq i64 %xtraiter3947, 0
  %7 = trunc i64 %3 to i32
  %8 = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %9 = phi i32 [ %31, %.loopexit.us..preheader.us_crit_edge ], [ %6, %.preheader.us.preheader ]
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %10
  br i1 %lcmp.mod40, label %.preheader.us..prol.loopexit38_crit_edge, label %.prol.preheader37

.preheader.us..prol.loopexit38_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit38

.prol.preheader37:                                ; preds = %.preheader.us
  %12 = load double, double* %5, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = load double, double* %11, align 8
  %17 = fsub double %16, %15
  store double %17, double* %11, align 8
  br label %.prol.loopexit38

.prol.loopexit38:                                 ; preds = %.preheader.us..prol.loopexit38_crit_edge, %.prol.preheader37
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader37 ], [ 0, %.preheader.us..prol.loopexit38_crit_edge ]
  br i1 %8, label %.prol.loopexit38..loopexit.us_crit_edge, label %.prol.loopexit38..preheader.us.new_crit_edge

.prol.loopexit38..loopexit.us_crit_edge:          ; preds = %.prol.loopexit38
  br label %.loopexit.us

.prol.loopexit38..preheader.us.new_crit_edge:     ; preds = %.prol.loopexit38
  %.pre49 = load double, double* %11, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.prol.loopexit38..preheader.us.new_crit_edge
  %18 = phi double [ %30, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.pre49, %.prol.loopexit38..preheader.us.new_crit_edge ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv29.unr.ph, %.prol.loopexit38..preheader.us.new_crit_edge ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv29
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %10
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %11, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next30
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next30, i64 %10
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %11, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next30.1, %indvars.iv43
  br i1 %exitcond36.1, label %.loopexit.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

.loopexit.us.loopexit:                            ; preds = %.preheader.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.prol.loopexit38..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %31 = add nsw i32 %9, 1
  %32 = icmp slt i32 %31, 2000
  br i1 %32, label %.loopexit.us..preheader.us_crit_edge, label %.loopexit9.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.preheader1:                                      ; preds = %.loopexit8..preheader1_crit_edge, %.preheader1.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %.loopexit8..preheader1_crit_edge ], [ 0, %.preheader1.preheader ]
  %33 = add i64 %indvars.iv21, 4294967295
  %34 = icmp sgt i64 %indvars.iv21, 0
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv21
  br i1 %34, label %.lr.ph, label %.preheader1..loopexit8_crit_edge

.preheader1..loopexit8_crit_edge:                 ; preds = %.preheader1
  br label %.loopexit8

.lr.ph:                                           ; preds = %.preheader1
  %xtraiter48 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter48, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %36 = load double, double* %5, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv21
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %35, align 8
  %41 = fsub double %40, %39
  store double %41, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %42 = trunc i64 %33 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %.prol.loopexit..loopexit8_crit_edge, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..loopexit8_crit_edge:              ; preds = %.prol.loopexit
  br label %.loopexit8

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  %.pre = load double, double* %35, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.prol.loopexit..lr.ph.new_crit_edge
  %44 = phi double [ %56, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.pre, %.prol.loopexit..lr.ph.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.new_crit_edge ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv21
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv21
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  store double %56, double* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond18.1, label %.loopexit8.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.loopexit8.loopexit:                              ; preds = %.lr.ph.new
  br label %.loopexit8

.loopexit8:                                       ; preds = %.prol.loopexit..loopexit8_crit_edge, %.preheader1..loopexit8_crit_edge, %.loopexit8.loopexit
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv21
  %58 = load double, double* %57, align 8
  %59 = load double, double* %35, align 8
  %60 = fdiv double %59, %58
  store double %60, double* %35, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next22, %indvars.iv43
  br i1 %exitcond28, label %.preheader.us.preheader, label %.loopexit8..preheader1_crit_edge

.loopexit8..preheader1_crit_edge:                 ; preds = %.loopexit8
  br label %.preheader1

.loopexit9.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit9

.loopexit9:                                       ; preds = %.preheader3..loopexit9_crit_edge, %.loopexit9.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond46, label %.loopexit10.loopexit, label %.loopexit9..preheader3_crit_edge

.loopexit9..preheader3_crit_edge:                 ; preds = %.loopexit9
  br label %.preheader3

.loopexit10.loopexit:                             ; preds = %.loopexit9
  br label %.loopexit10

.loopexit10:                                      ; preds = %..loopexit10_crit_edge, %.loopexit10.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader.us.preheader, label %..loopexit2_crit_edge

..loopexit2_crit_edge:                            ; preds = %2
  br label %.loopexit2

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %7 = phi i32 [ %23, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %8 = mul nsw i32 %7, 2000
  %9 = sext i32 %7 to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge5, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge5 ], [ 0, %.preheader.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %18

; <label>:18:                                     ; preds = %._crit_edge, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %9, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond4, label %.loopexit.us, label %._crit_edge5

._crit_edge5:                                     ; preds = %18
  br label %11

.loopexit.us:                                     ; preds = %18
  %23 = add nsw i32 %7, 1
  %24 = icmp slt i32 %23, 2000
  br i1 %24, label %.loopexit.us..preheader.us_crit_edge, label %.loopexit2.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit2.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %..loopexit2_crit_edge, %.loopexit2.loopexit
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #6
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
