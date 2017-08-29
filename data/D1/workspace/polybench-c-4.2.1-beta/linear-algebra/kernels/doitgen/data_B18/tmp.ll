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
  %xtraiter = and i32 %1, 1
  %11 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %xtraiter35 = and i32 %2, 1
  %lcmp.mod36 = icmp eq i32 %xtraiter35, 0
  %12 = icmp eq i32 %10, 0
  %wide.trip.count41 = zext i32 %2 to i64
  %xtraiter51 = and i32 %2, 3
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  %13 = icmp ult i32 %10, 3
  %wide.trip.count59 = zext i32 %0 to i64
  %14 = add nsw i32 %xtraiter51, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count.1, -2
  %18 = and i32 %1, 1
  %19 = zext i32 %18 to i64
  %20 = sub nsw i64 %17, %19
  %21 = lshr i64 %20, 1
  %22 = add nuw i64 %21, 1
  %23 = zext i32 %xtraiter to i64
  %xtraiter64 = and i64 %22, 7
  %lcmp.mod = icmp eq i64 %xtraiter64, 0
  %24 = icmp ult i64 %20, 14
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge13, %.preheader5.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next58, %._crit_edge13 ]
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %.preheader5
  br i1 %9, label %.lr.ph.us.us.preheader.preheader, label %.preheader4.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader4.lr.ph
  br label %.lr.ph.us.us.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  br i1 %11, label %._crit_edge13, label %._crit_edge11.1.preheader

._crit_edge11.1.preheader:                        ; preds = %.preheader4.preheader
  br i1 %lcmp.mod, label %._crit_edge11.1.prol.loopexit, label %._crit_edge11.1.prol.preheader

._crit_edge11.1.prol.preheader:                   ; preds = %._crit_edge11.1.preheader
  br label %._crit_edge11.1.prol

._crit_edge11.1.prol:                             ; preds = %._crit_edge11.1.prol, %._crit_edge11.1.prol.preheader
  %indvars.iv27.prol = phi i64 [ %indvars.iv.next28.1.prol, %._crit_edge11.1.prol ], [ %23, %._crit_edge11.1.prol.preheader ]
  %prol.iter65 = phi i64 [ %prol.iter65.sub, %._crit_edge11.1.prol ], [ %xtraiter64, %._crit_edge11.1.prol.preheader ]
  %indvars.iv.next28.1.prol = add nuw nsw i64 %indvars.iv27.prol, 2
  %prol.iter65.sub = add i64 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i64 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %._crit_edge11.1.prol.loopexit.unr-lcssa, label %._crit_edge11.1.prol, !llvm.loop !1

._crit_edge11.1.prol.loopexit.unr-lcssa:          ; preds = %._crit_edge11.1.prol
  br label %._crit_edge11.1.prol.loopexit

._crit_edge11.1.prol.loopexit:                    ; preds = %._crit_edge11.1.preheader, %._crit_edge11.1.prol.loopexit.unr-lcssa
  %indvars.iv27.unr = phi i64 [ %23, %._crit_edge11.1.preheader ], [ %indvars.iv.next28.1.prol, %._crit_edge11.1.prol.loopexit.unr-lcssa ]
  br i1 %24, label %._crit_edge13.loopexit63, label %._crit_edge11.1.preheader.new

._crit_edge11.1.preheader.new:                    ; preds = %._crit_edge11.1.prol.loopexit
  br label %._crit_edge11.1

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge11.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge11.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit:                        ; preds = %.lr.ph10.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit50
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count.1
  br i1 %exitcond56, label %._crit_edge13.loopexit, label %.lr.ph.us.us.preheader

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new.preheader, %.lr.ph10.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph10.us.new ], [ %indvars.iv42.unr, %.lr.ph10.us.new.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv42
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next43
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43.1
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next43.1
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43.2
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next43.2
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next43.3, %wide.trip.count41
  br i1 %exitcond45.3, label %._crit_edge11.us.loopexit, label %.lr.ph10.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next40, %._crit_edge.us.us ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv39
  store double 0.000000e+00, double* %46, align 8
  br i1 %lcmp.mod36, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %47 = load double, double* %25, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv39
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, 0.000000e+00
  store double %51, double* %46, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv32.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %51, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond, label %.lr.ph10.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.lr.ph.us.us.new ], [ %indvars.iv32.unr.ph, %.lr.ph.us.us.new.preheader ]
  %52 = phi double [ %64, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv32
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv39
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %46, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next33
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next33, i64 %indvars.iv39
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %46, align 8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %exitcond.138 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count41
  br i1 %exitcond.138, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod52, label %.prol.loopexit50, label %.prol.preheader49.preheader

.prol.preheader49.preheader:                      ; preds = %.lr.ph10.us
  br label %.prol.preheader49

.prol.preheader49:                                ; preds = %.prol.preheader49.preheader, %.prol.preheader49
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader49 ], [ 0, %.prol.preheader49.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader49 ], [ %xtraiter51, %.prol.preheader49.preheader ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv42.prol
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv42.prol
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit50.loopexit, label %.prol.preheader49, !llvm.loop !3

.prol.loopexit50.loopexit:                        ; preds = %.prol.preheader49
  br label %.prol.loopexit50

.prol.loopexit50:                                 ; preds = %.prol.loopexit50.loopexit, %.lr.ph10.us
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph10.us ], [ %16, %.prol.loopexit50.loopexit ]
  br i1 %13, label %._crit_edge11.us, label %.lr.ph10.us.new.preheader

.lr.ph10.us.new.preheader:                        ; preds = %.prol.loopexit50
  br label %.lr.ph10.us.new

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13.loopexit63.unr-lcssa:               ; preds = %._crit_edge11.1
  br label %._crit_edge13.loopexit63

._crit_edge13.loopexit63:                         ; preds = %._crit_edge11.1.prol.loopexit, %._crit_edge13.loopexit63.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit63, %._crit_edge13.loopexit, %.preheader4.preheader, %.preheader5
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %6
  ret void

._crit_edge11.1:                                  ; preds = %._crit_edge11.1, %._crit_edge11.1.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr, %._crit_edge11.1.preheader.new ], [ %indvars.iv.next28.1.7, %._crit_edge11.1 ]
  %indvars.iv.next28.1.7 = add nsw i64 %indvars.iv27, 16
  %exitcond.1.7 = icmp eq i64 %indvars.iv.next28.1.7, %wide.trip.count.1
  br i1 %exitcond.1.7, label %._crit_edge13.loopexit63.unr-lcssa, label %._crit_edge11.1
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
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
  tail call void @print_array([140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
.preheader6.us.preheader:
  br label %.preheader5.us.us.preheader

.preheader5.us.us.preheader:                      ; preds = %.preheader6.us.preheader, %._crit_edge15.us
  %indvars.iv36 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next37, %._crit_edge15.us ]
  br label %.preheader5.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge13.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 150
  br i1 %exitcond38, label %.preheader.us.preheader, label %.preheader5.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge15.us
  br label %.preheader.us

.preheader5.us.us:                                ; preds = %._crit_edge13.us.us, %.preheader5.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader5.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge13.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv33, %indvars.iv36
  br label %3

._crit_edge13.us.us:                              ; preds = %3
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond35, label %._crit_edge15.us, label %.preheader5.us.us

; <label>:3:                                      ; preds = %3, %.preheader5.us.us
  %indvars.iv30 = phi i64 [ 0, %.preheader5.us.us ], [ %indvars.iv.next31.1, %3 ]
  %4 = add nuw nsw i64 %indvars.iv30, %2
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv30
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %9 = add nuw nsw i64 %indvars.iv.next31, %2
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv30, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31.1, 160
  br i1 %exitcond32.1, label %._crit_edge13.us.us, label %3

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv28
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, 160
  br i1 %exitcond, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly) #1 {
.preheader3.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us.preheader, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next23, %._crit_edge6.us ]
  %5 = mul nuw nsw i64 %indvars.iv22, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 150
  br i1 %exitcond24, label %._crit_edge8, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %indvars.iv19, %5
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 140
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %15, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv22, i64 %indvars.iv19, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us.us, label %8

._crit_edge8:                                     ; preds = %._crit_edge6.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
