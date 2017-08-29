; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge59

.preheader6.lr.ph:                                ; preds = %6
  %8 = add i32 %2, -1
  %9 = and i32 %2, 3
  %10 = add nsw i32 %9, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = zext i32 %1 to i64
  %14 = zext i32 %2 to i64
  %xtraiter99 = and i32 %2, 1
  %15 = add nsw i64 %13, -1
  %xtraiter = and i64 %13, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge30, %.preheader6.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next, %._crit_edge30 ]
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %.preheader5.lr.ph, label %._crit_edge30

.preheader5.lr.ph:                                ; preds = %.preheader6
  %17 = icmp sgt i32 %2, 0
  br i1 %17, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %18 = icmp eq i64 %xtraiter, 0
  br i1 %18, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv76.prol = phi i64 [ %indvars.iv.next77.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.loopexit, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.loopexit:               ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.loopexit, %.preheader5.preheader
  %indvars.iv76.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next77.prol, %.preheader5.prol.loopexit.loopexit ]
  %19 = icmp ult i64 %15, 7
  br i1 %19, label %._crit_edge30, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge27.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge27.us ], [ 0, %.preheader5.us.preheader ]
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 0
  br label %.lr.ph.us.us

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph26.us.new
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit104
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next93, %13
  br i1 %exitcond114, label %._crit_edge30.loopexit, label %.preheader5.us

.lr.ph26.us.new:                                  ; preds = %.lr.ph26.us.new.preheader, %.lr.ph26.us.new
  %indvars.iv88 = phi i64 [ %indvars.iv.next89.3, %.lr.ph26.us.new ], [ %indvars.iv88.unr, %.lr.ph26.us.new.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv88
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv88
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next89
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv.next89
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next89.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv.next89.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next89.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv.next89.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  %exitcond91.3 = icmp eq i64 %indvars.iv.next89.3, %14
  br i1 %exitcond91.3, label %._crit_edge27.us.loopexit, label %.lr.ph26.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader5.us
  %indvars.iv84 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next85, %._crit_edge.us.us ]
  %41 = icmp eq i32 %xtraiter99, 0
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  store double 0.000000e+00, double* %42, align 8
  br i1 %41, label %.prol.loopexit98, label %.prol.preheader97

.prol.preheader97:                                ; preds = %.lr.ph.us.us
  %43 = load double, double* %20, align 8
  %44 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv84
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, 0.000000e+00
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr118 = shl i64 %indvars.iv84, 3
  %sunkaddr119 = add i64 %sunkaddr, %sunkaddr118
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to double*
  store double %47, double* %sunkaddr120, align 8
  br label %.prol.loopexit98

.prol.loopexit98:                                 ; preds = %.prol.preheader97, %.lr.ph.us.us
  %indvars.iv80.unr.ph = phi i64 [ 1, %.prol.preheader97 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %47, %.prol.preheader97 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %48 = icmp eq i32 %8, 0
  br i1 %48, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit98
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit98
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next85, %14
  br i1 %exitcond113, label %.lr.ph26.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph.us.us.new ], [ %indvars.iv80.unr.ph, %.lr.ph.us.us.new.preheader ]
  %49 = phi double [ %61, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv80
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv84
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %54, %49
  %sunkaddr121 = ptrtoint double* %5 to i64
  %sunkaddr122 = shl i64 %indvars.iv84, 3
  %sunkaddr123 = add i64 %sunkaddr121, %sunkaddr122
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to double*
  store double %55, double* %sunkaddr124, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv.next81
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next81, i64 %indvars.iv84
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, %55
  store double %61, double* %sunkaddr124, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81.1, %14
  br i1 %exitcond83.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph26.us:                                      ; preds = %._crit_edge.us.us
  %62 = icmp eq i32 %9, 0
  br i1 %62, label %.prol.loopexit104, label %.prol.preheader103.preheader

.prol.preheader103.preheader:                     ; preds = %.lr.ph26.us
  br label %.prol.preheader103

.prol.preheader103:                               ; preds = %.prol.preheader103.preheader, %.prol.preheader103
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %.prol.preheader103 ], [ 0, %.prol.preheader103.preheader ]
  %prol.iter107 = phi i32 [ %prol.iter107.sub, %.prol.preheader103 ], [ %9, %.prol.preheader103.preheader ]
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv88.prol
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv92, i64 %indvars.iv88.prol
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next89.prol = add nuw nsw i64 %indvars.iv88.prol, 1
  %prol.iter107.sub = add nsw i32 %prol.iter107, -1
  %prol.iter107.cmp = icmp eq i32 %prol.iter107.sub, 0
  br i1 %prol.iter107.cmp, label %.prol.loopexit104.loopexit, label %.prol.preheader103, !llvm.loop !3

.prol.loopexit104.loopexit:                       ; preds = %.prol.preheader103
  br label %.prol.loopexit104

.prol.loopexit104:                                ; preds = %.prol.loopexit104.loopexit, %.lr.ph26.us
  %indvars.iv88.unr = phi i64 [ 0, %.lr.ph26.us ], [ %12, %.prol.loopexit104.loopexit ]
  %68 = icmp ult i32 %8, 3
  br i1 %68, label %._crit_edge27.us, label %.lr.ph26.us.new.preheader

.lr.ph26.us.new.preheader:                        ; preds = %.prol.loopexit104
  br label %.lr.ph26.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr, %.preheader5.preheader.new ], [ %indvars.iv.next77.7, %.preheader5 ]
  %indvars.iv.next77.7 = add nsw i64 %indvars.iv76, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next77.7, %13
  br i1 %exitcond.7, label %._crit_edge30.loopexit125, label %.preheader5

._crit_edge30.loopexit:                           ; preds = %._crit_edge27.us
  br label %._crit_edge30

._crit_edge30.loopexit125:                        ; preds = %.preheader5
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit125, %._crit_edge30.loopexit, %.preheader5.prol.loopexit, %.preheader6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond117, label %._crit_edge59.loopexit, label %.preheader6

._crit_edge59.loopexit:                           ; preds = %._crit_edge30
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader7.us.preheader:
  br label %.preheader6.us.us.preheader

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us.preheader, %._crit_edge17.us
  %indvars.iv54 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next55, %._crit_edge17.us ]
  br label %.preheader6.us.us.new

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 150
  br i1 %exitcond57, label %.preheader.us.new.preheader, label %.preheader6.us.us.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge17.us
  br label %.preheader.us.new

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv50 = phi i64 [ 0, %.preheader6.us.us.preheader ], [ %indvars.iv.next51, %._crit_edge14.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv50, %indvars.iv54
  br label %3

._crit_edge14.us.us:                              ; preds = %3
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 140
  br i1 %exitcond53, label %._crit_edge17.us, label %.preheader6.us.us.new

; <label>:3:                                      ; preds = %3, %.preheader6.us.us.new
  %indvars.iv46 = phi i64 [ 0, %.preheader6.us.us.new ], [ %indvars.iv.next47.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv46
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv46
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next47
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, 160
  br i1 %exitcond49.1, label %._crit_edge14.us.us, label %3

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv41, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv41, %indvars.iv.next
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
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 160
  br i1 %exitcond44, label %._crit_edge10, label %.preheader.us.new

._crit_edge10:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader3.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv34 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next35, %._crit_edge5.us ]
  %5 = mul nuw nsw i64 %indvars.iv34, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 150
  br i1 %exitcond37, label %20, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv30
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 140
  br i1 %exitcond33, label %._crit_edge5.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %15, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
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
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond29, label %._crit_edge.us.us, label %8

; <label>:20:                                     ; preds = %._crit_edge5.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
