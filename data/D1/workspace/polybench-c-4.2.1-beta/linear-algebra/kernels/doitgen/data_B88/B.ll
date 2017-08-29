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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = alloca [160 x double]*, align 8
  store [160 x double]* %4, [160 x double]** %7, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %11 = add i32 %2, -1
  %xtraiter59 = and i32 %2, 1
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %12 = icmp eq i32 %11, 0
  %wide.trip.count46 = zext i32 %2 to i64
  %xtraiter65 = and i32 %2, 3
  %lcmp.mod66 = icmp eq i32 %xtraiter65, 0
  %13 = icmp ult i32 %11, 3
  %wide.trip.count54 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter65, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count54, -1
  %xtraiter = and i64 %wide.trip.count54, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %17, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %19

; <label>:19:                                     ; preds = %._crit_edge15, %.lr.ph28
  %indvars.iv = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next, %._crit_edge15 ]
  br i1 %9, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %19
  br i1 %10, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br i1 %lcmp.mod, label %.lr.ph14.split.prol.loopexit, label %.lr.ph14.split.prol.preheader

.lr.ph14.split.prol.preheader:                    ; preds = %.lr.ph14.split.preheader
  br label %.lr.ph14.split.prol

.lr.ph14.split.prol:                              ; preds = %.lr.ph14.split.prol, %.lr.ph14.split.prol.preheader
  %indvars.iv32.prol = phi i64 [ %indvars.iv.next33.prol, %.lr.ph14.split.prol ], [ 0, %.lr.ph14.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph14.split.prol ], [ %xtraiter, %.lr.ph14.split.prol.preheader ]
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph14.split.prol.loopexit.unr-lcssa, label %.lr.ph14.split.prol, !llvm.loop !1

.lr.ph14.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph14.split.prol
  br label %.lr.ph14.split.prol.loopexit

.lr.ph14.split.prol.loopexit:                     ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split.prol.loopexit.unr-lcssa
  %indvars.iv32.unr = phi i64 [ 0, %.lr.ph14.split.preheader ], [ %indvars.iv.next33.prol, %.lr.ph14.split.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge15.loopexit70, label %.lr.ph14.split.preheader.new

.lr.ph14.split.preheader.new:                     ; preds = %.lr.ph14.split.prol.loopexit
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge12.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge12.us ], [ 0, %.lr.ph14.split.us.preheader ]
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit64
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge15.loopexit, label %.lr.ph14.split.us

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.3, %.lr.ph11.us.new ], [ %indvars.iv48.unr, %.lr.ph11.us.new.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv48
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv48
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next49
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv.next49
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next49.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv.next49.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next49.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv.next49.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  %exitcond51.3 = icmp eq i64 %indvars.iv.next49.3, %wide.trip.count46
  br i1 %exitcond51.3, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

.lr.ph.us.us:                                     ; preds = %.lr.ph14.split.us, %._crit_edge.us.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge.us.us ], [ 0, %.lr.ph14.split.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv44
  store double 0.000000e+00, double* %41, align 8
  %sunkaddr1.us.us = shl nsw i64 %indvars.iv44, 3
  %sunkaddr2.us.us = add i64 %sunkaddr, %sunkaddr1.us.us
  %sunkaddr3.us.us = inttoptr i64 %sunkaddr2.us.us to double*
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57

.prol.preheader57:                                ; preds = %.lr.ph.us.us
  %42 = load double, double* %20, align 8
  %43 = load [160 x double]*, [160 x double]** %7, align 8
  %44 = getelementptr inbounds [160 x double], [160 x double]* %43, i64 0, i64 %indvars.iv44
  %45 = load double, double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fadd double %46, 0.000000e+00
  store double %47, double* %sunkaddr3.us.us, align 8
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.preheader57, %.lr.ph.us.us
  %indvars.iv40.unr.ph = phi i64 [ 1, %.prol.preheader57 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %47, %.prol.preheader57 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit58
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit58
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %.lr.ph11.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %.lr.ph.us.us.new ], [ %indvars.iv40.unr.ph, %.lr.ph.us.us.new.preheader ]
  %48 = phi double [ %62, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv40
  %50 = load double, double* %49, align 8
  %51 = load [160 x double]*, [160 x double]** %7, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %51, i64 %indvars.iv40, i64 %indvars.iv44
  %53 = load double, double* %52, align 8
  %54 = fmul double %50, %53
  %55 = fadd double %48, %54
  store double %55, double* %sunkaddr3.us.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv.next41
  %57 = load double, double* %56, align 8
  %58 = load [160 x double]*, [160 x double]** %7, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %58, i64 %indvars.iv.next41, i64 %indvars.iv44
  %60 = load double, double* %59, align 8
  %61 = fmul double %57, %60
  %62 = fadd double %55, %61
  store double %62, double* %sunkaddr3.us.us, align 8
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, %wide.trip.count46
  br i1 %exitcond43.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph11.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod66, label %.prol.loopexit64, label %.prol.preheader63.preheader

.prol.preheader63.preheader:                      ; preds = %.lr.ph11.us
  br label %.prol.preheader63

.prol.preheader63:                                ; preds = %.prol.preheader63.preheader, %.prol.preheader63
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.prol.preheader63 ], [ 0, %.prol.preheader63.preheader ]
  %prol.iter67 = phi i32 [ %prol.iter67.sub, %.prol.preheader63 ], [ %xtraiter65, %.prol.preheader63.preheader ]
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv48.prol
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv52, i64 %indvars.iv48.prol
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter67.sub = add nsw i32 %prol.iter67, -1
  %prol.iter67.cmp = icmp eq i32 %prol.iter67.sub, 0
  br i1 %prol.iter67.cmp, label %.prol.loopexit64.loopexit, label %.prol.preheader63, !llvm.loop !3

.prol.loopexit64.loopexit:                        ; preds = %.prol.preheader63
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.prol.loopexit64.loopexit, %.lr.ph11.us
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph11.us ], [ %16, %.prol.loopexit64.loopexit ]
  br i1 %13, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit64
  br label %.lr.ph11.us.new

.lr.ph14.split:                                   ; preds = %.lr.ph14.split, %.lr.ph14.split.preheader.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr, %.lr.ph14.split.preheader.new ], [ %indvars.iv.next33.7, %.lr.ph14.split ]
  %indvars.iv.next33.7 = add nsw i64 %indvars.iv32, 8
  %exitcond35.7 = icmp eq i64 %indvars.iv.next33.7, %wide.trip.count54
  br i1 %exitcond35.7, label %._crit_edge15.loopexit70.unr-lcssa, label %.lr.ph14.split

._crit_edge15.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge15

._crit_edge15.loopexit70.unr-lcssa:               ; preds = %.lr.ph14.split
  br label %._crit_edge15.loopexit70

._crit_edge15.loopexit70:                         ; preds = %.lr.ph14.split.prol.loopexit, %._crit_edge15.loopexit70.unr-lcssa
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit70, %._crit_edge15.loopexit, %19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge29.loopexit, label %19

._crit_edge29.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.lr.ph11.split.us.preheader:
  br label %.lr.ph5.us.us.preheader

.lr.ph5.us.us.preheader:                          ; preds = %.lr.ph11.split.us.preheader, %._crit_edge9.us
  %indvars.iv32 = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next33, %._crit_edge9.us ]
  br label %.lr.ph5.us.us.new

._crit_edge9.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 150
  br i1 %exitcond35, label %.lr.ph.us.new.preheader, label %.lr.ph5.us.us.preheader

.lr.ph.us.new.preheader:                          ; preds = %._crit_edge9.us
  br label %.lr.ph.us.new

.lr.ph5.us.us.new:                                ; preds = %.lr.ph5.us.us.preheader, %._crit_edge6.us.us
  %indvars.iv28 = phi i64 [ 0, %.lr.ph5.us.us.preheader ], [ %indvars.iv.next29, %._crit_edge6.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv32, %indvars.iv28
  br label %3

._crit_edge6.us.us:                               ; preds = %3
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 140
  br i1 %exitcond31, label %._crit_edge9.us, label %.lr.ph5.us.us.new

; <label>:3:                                      ; preds = %3, %.lr.ph5.us.us.new
  %indvars.iv24 = phi i64 [ 0, %.lr.ph5.us.us.new ], [ %indvars.iv.next25.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv24
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv24
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next25
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, 160
  br i1 %exitcond27.1, label %._crit_edge6.us.us, label %3

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %._crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us ], [ 0, %.lr.ph.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.us.new
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.new ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv19, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv19, %indvars.iv.next
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
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 160
  br i1 %exitcond22, label %._crit_edge3, label %.lr.ph.us.new

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph5.split.us.preheader, %._crit_edge3.us
  %indvars.iv19 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next20, %._crit_edge3.us ]
  %5 = mul nuw nsw i64 %indvars.iv19, 140
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 150
  br i1 %exitcond22, label %._crit_edge6, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv15
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 140
  br i1 %exitcond18, label %._crit_edge3.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %15, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv19, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond14, label %._crit_edge.us.us, label %8

._crit_edge6:                                     ; preds = %._crit_edge3.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
