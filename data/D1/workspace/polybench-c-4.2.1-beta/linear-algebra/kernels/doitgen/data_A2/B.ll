; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge22

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %xtraiter56 = and i32 %2, 3
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  %11 = icmp ult i32 %10, 3
  %wide.trip.count49.3 = zext i32 %2 to i64
  %wide.trip.count61 = zext i32 %1 to i64
  %xtraiter41 = and i32 %2, 1
  %lcmp.mod42 = icmp eq i32 %xtraiter41, 0
  %12 = icmp eq i32 %10, 0
  %wide.trip.count65 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count61, -1
  %xtraiter = and i64 %wide.trip.count61, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %13, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge14, %.preheader6.lr.ph
  %indvars.iv63 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next64, %._crit_edge14 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge14

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv28.prol = phi i64 [ %indvars.iv.next29.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv28.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next29.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %14, label %._crit_edge14.loopexit69, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge12.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge12.us ], [ 0, %.preheader5.us.preheader ]
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit55
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge14.loopexit, label %.preheader5.us

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.3, %.lr.ph11.us.new ], [ %indvars.iv47.unr, %.lr.ph11.us.new.preheader ]
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv47
  %17 = bitcast double* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv47
  %20 = bitcast double* %19 to i64*
  store i64 %18, i64* %20, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next48
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv.next48
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next48.1
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv.next48.1
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next48.2
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv.next48.2
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  %exitcond50.3 = icmp eq i64 %indvars.iv.next48.3, %wide.trip.count49.3
  br i1 %exitcond50.3, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  store double 0.000000e+00, double* %36, align 8
  br i1 %lcmp.mod42, label %.prol.loopexit40, label %.prol.preheader39

.prol.preheader39:                                ; preds = %.lr.ph.us.us
  %37 = load double, double* %15, align 8
  %38 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv43
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %40, 0.000000e+00
  store double %41, double* %36, align 8
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.prol.preheader39, %.lr.ph.us.us
  %42 = phi double [ %41, %.prol.preheader39 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader39 ], [ 0, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit40
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit40
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count49.3
  br i1 %exitcond46, label %.lr.ph11.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %43 = phi double [ %55, %.lr.ph.us.us.new ], [ %42, %.lr.ph.us.us.new.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph.us.us.new ], [ %indvars.iv35.unr.ph, %.lr.ph.us.us.new.preheader ]
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv35
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv43
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %36, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv.next36
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next36, i64 %indvars.iv43
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %36, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count49.3
  br i1 %exitcond38.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph11.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54.preheader

.prol.preheader54.preheader:                      ; preds = %.lr.ph11.us
  br label %.prol.preheader54

.prol.preheader54:                                ; preds = %.prol.preheader54.preheader, %.prol.preheader54
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.prol.preheader54 ], [ 0, %.prol.preheader54.preheader ]
  %prol.iter58 = phi i32 [ %prol.iter58.sub, %.prol.preheader54 ], [ %xtraiter56, %.prol.preheader54.preheader ]
  %56 = getelementptr inbounds double, double* %5, i64 %indvars.iv47.prol
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv47.prol
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next48.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter58.sub = add i32 %prol.iter58, -1
  %prol.iter58.cmp = icmp eq i32 %prol.iter58.sub, 0
  br i1 %prol.iter58.cmp, label %.prol.loopexit55.loopexit, label %.prol.preheader54, !llvm.loop !3

.prol.loopexit55.loopexit:                        ; preds = %.prol.preheader54
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.prol.loopexit55.loopexit, %.lr.ph11.us
  %indvars.iv47.unr = phi i64 [ 0, %.lr.ph11.us ], [ %indvars.iv.next48.prol, %.prol.loopexit55.loopexit ]
  br i1 %11, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit55
  br label %.lr.ph11.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr, %.preheader5.preheader.new ], [ %indvars.iv.next29.7, %.preheader5 ]
  %indvars.iv.next29.7 = add nsw i64 %indvars.iv28, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next29.7, %wide.trip.count61
  br i1 %exitcond.7, label %._crit_edge14.loopexit69.unr-lcssa, label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14.loopexit69.unr-lcssa:               ; preds = %.preheader5
  br label %._crit_edge14.loopexit69

._crit_edge14.loopexit69:                         ; preds = %.preheader5.prol.loopexit, %._crit_edge14.loopexit69.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit69, %._crit_edge14.loopexit, %.preheader6
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge22.loopexit, label %.preheader6

._crit_edge22.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader7.lr.ph, label %.preheader5

.preheader7.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %2, 0
  %9 = sitofp i32 %2 to double
  br i1 %7, label %.preheader7.us.preheader, label %.preheader5

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %wide.trip.count48 = zext i32 %0 to i64
  %xtraiter40 = and i32 %2, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %10 = icmp eq i32 %2, 1
  %wide.trip.count44 = zext i32 %1 to i64
  %wide.trip.count36.1 = zext i32 %2 to i64
  %11 = insertelement <2 x double> undef, double %9, i32 0
  %12 = insertelement <2 x double> %11, double %9, i32 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge16.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge16.us ], [ 0, %.preheader7.us.preheader ]
  br i1 %8, label %.preheader6.us.us.preheader, label %._crit_edge16.us

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us
  br label %.preheader6.us.us

._crit_edge16.us.loopexit:                        ; preds = %._crit_edge14.us.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %.preheader7.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %.preheader5.loopexit, label %.preheader7.us

.preheader6.us.us:                                ; preds = %.preheader6.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge14.us.us ], [ 0, %.preheader6.us.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv42, %indvars.iv46
  br i1 %lcmp.mod41, label %.prol.loopexit39, label %.prol.preheader38

.prol.preheader38:                                ; preds = %.preheader6.us.us
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %2
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %9
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv46, i64 %indvars.iv42, i64 0
  store double %17, double* %18, align 8
  br label %.prol.loopexit39

.prol.loopexit39:                                 ; preds = %.prol.preheader38, %.preheader6.us.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader38 ], [ 0, %.preheader6.us.us ]
  br i1 %10, label %._crit_edge14.us.us, label %.preheader6.us.us.new.preheader

.preheader6.us.us.new.preheader:                  ; preds = %.prol.loopexit39
  br label %.preheader6.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.preheader6.us.us.new
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit39
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge16.us.loopexit, label %.preheader6.us.us

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us.new.preheader, %.preheader6.us.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.preheader6.us.us.new ], [ %indvars.iv34.unr.ph, %.preheader6.us.us.new.preheader ]
  %19 = add nsw i64 %indvars.iv34, %13
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %2
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv46, i64 %indvars.iv42, i64 %indvars.iv34
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %24 = add nsw i64 %indvars.iv.next35, %13
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %2
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, %12
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond37.1, label %._crit_edge14.us.us.loopexit, label %.preheader6.us.us.new

.preheader5.loopexit:                             ; preds = %._crit_edge16.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7.lr.ph, %5
  %32 = icmp sgt i32 %2, 0
  br i1 %32, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %.preheader5
  %33 = sitofp i32 %2 to double
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %2, 1
  %wide.trip.count32 = zext i32 %2 to i64
  %35 = fdiv double 0.000000e+00, %33
  %36 = insertelement <2 x double> undef, double %33, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %38 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv30, i64 0
  store double %35, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %34, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %39 = mul nuw nsw i64 %indvars.iv, %indvars.iv30
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %2
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv30
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %2
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %37
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count32
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %4
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader3.us.preheader, label %._crit_edge8

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %12 = sext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next24, %._crit_edge6.us ]
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge6.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %13 = mul nsw i64 %indvars.iv23, %12
  %14 = trunc i64 %13 to i32
  br label %.preheader.us.us

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.preheader3.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge8.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %15 = trunc i64 %indvars.iv19 to i32
  %16 = add i32 %15, %14
  %17 = mul i32 %16, %2
  %18 = zext i32 %17 to i64
  br label %19

._crit_edge.us.us:                                ; preds = %26
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge6.us.loopexit, label %.preheader.us.us

; <label>:19:                                     ; preds = %26, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.preheader.us.us ]
  %20 = add i64 %indvars.iv, %18
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %19
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %24, %19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %19

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3.lr.ph, %4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
