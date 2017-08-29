; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %xtraiter55 = and i32 %2, 3
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  %11 = icmp ult i32 %10, 3
  %wide.trip.count48.3 = zext i32 %2 to i64
  %wide.trip.count60 = zext i32 %1 to i64
  %xtraiter40 = and i32 %2, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %12 = icmp eq i32 %10, 0
  %wide.trip.count64 = zext i32 %0 to i64
  %13 = add nsw i32 %xtraiter55, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count60, -1
  %xtraiter = and i64 %wide.trip.count60, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %16, 7
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge13, %.preheader5.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next63, %._crit_edge13 ]
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %.preheader5
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  br i1 %lcmp.mod, label %.preheader4.prol.loopexit, label %.preheader4.prol.preheader

.preheader4.prol.preheader:                       ; preds = %.preheader4.preheader
  br label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.preheader4.prol, %.preheader4.prol.preheader
  %indvars.iv27.prol = phi i64 [ %indvars.iv.next28.prol, %.preheader4.prol ], [ 0, %.preheader4.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.prol ], [ %xtraiter, %.preheader4.prol.preheader ]
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader4.prol.loopexit.unr-lcssa, label %.preheader4.prol, !llvm.loop !1

.preheader4.prol.loopexit.unr-lcssa:              ; preds = %.preheader4.prol
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.preheader, %.preheader4.prol.loopexit.unr-lcssa
  %indvars.iv27.unr = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next28.prol, %.preheader4.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge13.loopexit68, label %.preheader4.preheader.new

.preheader4.preheader.new:                        ; preds = %.preheader4.prol.loopexit
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit:                        ; preds = %.lr.ph10.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit54
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge13.loopexit, label %.preheader4.us

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new.preheader, %.lr.ph10.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph10.us.new ], [ %indvars.iv46.unr, %.lr.ph10.us.new.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv46
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.1
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.2
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.2
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next47.3, %wide.trip.count48.3
  br i1 %exitcond49.3, label %._crit_edge11.us.loopexit, label %.lr.ph10.us.new

.lr.ph.us.us:                                     ; preds = %.preheader4.us, %._crit_edge.us.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge.us.us ], [ 0, %.preheader4.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  store double 0.000000e+00, double* %39, align 8
  br i1 %lcmp.mod41, label %.prol.loopexit39, label %.prol.preheader38

.prol.preheader38:                                ; preds = %.lr.ph.us.us
  %40 = load double, double* %18, align 8
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv42
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, 0.000000e+00
  store double %44, double* %39, align 8
  br label %.prol.loopexit39

.prol.loopexit39:                                 ; preds = %.prol.preheader38, %.lr.ph.us.us
  %45 = phi double [ %44, %.prol.preheader38 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader38 ], [ 0, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit39
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit39
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count48.3
  br i1 %exitcond45, label %.lr.ph10.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %46 = phi double [ %58, %.lr.ph.us.us.new ], [ %45, %.lr.ph.us.us.new.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph.us.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph.us.us.new.preheader ]
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv34
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv42
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %39, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next35
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next35, i64 %indvars.iv42
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %39, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count48.3
  br i1 %exitcond37.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53.preheader

.prol.preheader53.preheader:                      ; preds = %.lr.ph10.us
  br label %.prol.preheader53

.prol.preheader53:                                ; preds = %.prol.preheader53.preheader, %.prol.preheader53
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader53 ], [ 0, %.prol.preheader53.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %.prol.preheader53 ], [ %xtraiter55, %.prol.preheader53.preheader ]
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv46.prol
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46.prol
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter57.sub = add nsw i32 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i32 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.prol.loopexit54.loopexit, label %.prol.preheader53, !llvm.loop !3

.prol.loopexit54.loopexit:                        ; preds = %.prol.preheader53
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.loopexit54.loopexit, %.lr.ph10.us
  %indvars.iv46.unr = phi i64 [ 0, %.lr.ph10.us ], [ %15, %.prol.loopexit54.loopexit ]
  br i1 %11, label %._crit_edge11.us, label %.lr.ph10.us.new.preheader

.lr.ph10.us.new.preheader:                        ; preds = %.prol.loopexit54
  br label %.lr.ph10.us.new

.preheader4:                                      ; preds = %.preheader4, %.preheader4.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr, %.preheader4.preheader.new ], [ %indvars.iv.next28.7, %.preheader4 ]
  %indvars.iv.next28.7 = add nsw i64 %indvars.iv27, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next28.7, %wide.trip.count60
  br i1 %exitcond.7, label %._crit_edge13.loopexit68.unr-lcssa, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13.loopexit68.unr-lcssa:               ; preds = %.preheader4
  br label %._crit_edge13.loopexit68

._crit_edge13.loopexit68:                         ; preds = %.preheader4.prol.loopexit, %._crit_edge13.loopexit68.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit68, %._crit_edge13.loopexit, %.preheader5
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %6
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
  br i1 %6, label %.preheader6.lr.ph, label %.preheader4

.preheader6.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %2, 0
  %9 = sitofp i32 %2 to double
  br i1 %7, label %.preheader6.us.preheader, label %.preheader4

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count46 = zext i32 %0 to i64
  %xtraiter38 = and i32 %2, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %10 = icmp eq i32 %2, 1
  %wide.trip.count42 = zext i32 %1 to i64
  %wide.trip.count34.1 = zext i32 %2 to i64
  %11 = insertelement <2 x double> undef, double %9, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge15.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge15.us ], [ 0, %.preheader6.us.preheader ]
  br i1 %8, label %.preheader5.us.us.preheader, label %._crit_edge15.us

.preheader5.us.us.preheader:                      ; preds = %.preheader6.us
  br label %.preheader5.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge13.us.us
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.preheader6.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %.preheader4.loopexit, label %.preheader6.us

.preheader5.us.us:                                ; preds = %.preheader5.us.us.preheader, %._crit_edge13.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge13.us.us ], [ 0, %.preheader5.us.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv40, %indvars.iv44
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36

.prol.preheader36:                                ; preds = %.preheader5.us.us
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %2
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %9
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv44, i64 %indvars.iv40, i64 0
  store double %17, double* %18, align 8
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.preheader36, %.preheader5.us.us
  %indvars.iv32.unr.ph = phi i64 [ 1, %.prol.preheader36 ], [ 0, %.preheader5.us.us ]
  br i1 %10, label %._crit_edge13.us.us, label %.preheader5.us.us.new.preheader

.preheader5.us.us.new.preheader:                  ; preds = %.prol.loopexit37
  br label %.preheader5.us.us.new

._crit_edge13.us.us.loopexit:                     ; preds = %.preheader5.us.us.new
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.loopexit, %.prol.loopexit37
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge15.us.loopexit, label %.preheader5.us.us

.preheader5.us.us.new:                            ; preds = %.preheader5.us.us.new.preheader, %.preheader5.us.us.new
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.preheader5.us.us.new ], [ %indvars.iv32.unr.ph, %.preheader5.us.us.new.preheader ]
  %19 = add nsw i64 %indvars.iv32, %13
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %2
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv32
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %24 = add nsw i64 %indvars.iv.next33, %13
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %2
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, %12
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count34.1
  br i1 %exitcond35.1, label %._crit_edge13.us.us.loopexit, label %.preheader5.us.us.new

.preheader4.loopexit:                             ; preds = %._crit_edge15.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader6.lr.ph, %5
  %32 = icmp sgt i32 %2, 0
  br i1 %32, label %.preheader.lr.ph, label %._crit_edge10

.preheader.lr.ph:                                 ; preds = %.preheader4
  %33 = sitofp i32 %2 to double
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %2, 1
  %wide.trip.count30 = zext i32 %2 to i64
  %35 = fdiv double 0.000000e+00, %33
  %36 = insertelement <2 x double> undef, double %33, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %38 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 0
  store double %35, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %34, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %39 = mul nuw nsw i64 %indvars.iv, %indvars.iv28
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %2
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %2
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %37
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count30
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader4
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
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %19

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3.lr.ph, %4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
