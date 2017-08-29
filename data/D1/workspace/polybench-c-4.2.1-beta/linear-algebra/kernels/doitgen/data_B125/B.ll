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

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = alloca [160 x double]*, align 8
  store [160 x double]* %4, [160 x double]** %7, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader7.lr.ph, label %._crit_edge26

.preheader7.lr.ph:                                ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %11 = add i32 %2, -1
  %xtraiter56 = and i32 %2, 1
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  %12 = icmp eq i32 %11, 0
  %wide.trip.count43 = zext i32 %2 to i64
  %xtraiter62 = and i32 %2, 3
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  %13 = icmp ult i32 %11, 3
  %wide.trip.count51 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter62, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count51, -1
  %xtraiter = and i64 %wide.trip.count51, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %17, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge14, %.preheader7.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next, %._crit_edge14 ]
  br i1 %9, label %.preheader6.lr.ph, label %._crit_edge14

.preheader6.lr.ph:                                ; preds = %.preheader7
  br i1 %10, label %.preheader6.us.preheader, label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader6.lr.ph
  br i1 %lcmp.mod, label %.preheader6.prol.loopexit, label %.preheader6.prol.preheader

.preheader6.prol.preheader:                       ; preds = %.preheader6.preheader
  br label %.preheader6.prol

.preheader6.prol:                                 ; preds = %.preheader6.prol, %.preheader6.prol.preheader
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %.preheader6.prol ], [ 0, %.preheader6.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader6.prol ], [ %xtraiter, %.preheader6.prol.preheader ]
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader6.prol.loopexit.unr-lcssa, label %.preheader6.prol, !llvm.loop !1

.preheader6.prol.loopexit.unr-lcssa:              ; preds = %.preheader6.prol
  br label %.preheader6.prol.loopexit

.preheader6.prol.loopexit:                        ; preds = %.preheader6.preheader, %.preheader6.prol.loopexit.unr-lcssa
  %indvars.iv29.unr = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next30.prol, %.preheader6.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge14.loopexit67, label %.preheader6.preheader.new

.preheader6.preheader.new:                        ; preds = %.preheader6.prol.loopexit
  br label %.preheader6

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge12.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge12.us ], [ 0, %.preheader6.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit61
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %._crit_edge14.loopexit, label %.preheader6.us

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.3, %.lr.ph11.us.new ], [ %indvars.iv45.unr, %.lr.ph11.us.new.preheader ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv45
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv45
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv.next46
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46.1
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv.next46.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv45, 3
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46.2
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv.next46.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %exitcond48.3 = icmp eq i64 %indvars.iv.next46.3, %wide.trip.count43
  br i1 %exitcond48.3, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

.lr.ph.us.us:                                     ; preds = %.preheader6.us, %._crit_edge.us.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge.us.us ], [ 0, %.preheader6.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv41
  store double 0.000000e+00, double* %40, align 8
  %sunkaddr1.us.us = shl nsw i64 %indvars.iv41, 3
  %sunkaddr2.us.us = add i64 %sunkaddr, %sunkaddr1.us.us
  %sunkaddr3.us.us = inttoptr i64 %sunkaddr2.us.us to double*
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54

.prol.preheader54:                                ; preds = %.lr.ph.us.us
  %41 = load double, double* %19, align 8
  %42 = load [160 x double]*, [160 x double]** %7, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %42, i64 0, i64 %indvars.iv41
  %44 = load double, double* %43, align 8
  %45 = fmul double %41, %44
  %46 = fadd double %45, 0.000000e+00
  store double %46, double* %sunkaddr3.us.us, align 8
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.prol.preheader54, %.lr.ph.us.us
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader54 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %46, %.prol.preheader54 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit55
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit55
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %.lr.ph11.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %47 = phi double [ %61, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv37
  %49 = load double, double* %48, align 8
  %50 = load [160 x double]*, [160 x double]** %7, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %50, i64 %indvars.iv37, i64 %indvars.iv41
  %52 = load double, double* %51, align 8
  %53 = fmul double %49, %52
  %54 = fadd double %47, %53
  store double %54, double* %sunkaddr3.us.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv.next38
  %56 = load double, double* %55, align 8
  %57 = load [160 x double]*, [160 x double]** %7, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %57, i64 %indvars.iv.next38, i64 %indvars.iv41
  %59 = load double, double* %58, align 8
  %60 = fmul double %56, %59
  %61 = fadd double %54, %60
  store double %61, double* %sunkaddr3.us.us, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv37, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count43
  br i1 %exitcond40.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph11.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60.preheader

.prol.preheader60.preheader:                      ; preds = %.lr.ph11.us
  br label %.prol.preheader60

.prol.preheader60:                                ; preds = %.prol.preheader60.preheader, %.prol.preheader60
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.prol.preheader60 ], [ 0, %.prol.preheader60.preheader ]
  %prol.iter64 = phi i32 [ %prol.iter64.sub, %.prol.preheader60 ], [ %xtraiter62, %.prol.preheader60.preheader ]
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv45.prol
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv49, i64 %indvars.iv45.prol
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv45.prol, 1
  %prol.iter64.sub = add nsw i32 %prol.iter64, -1
  %prol.iter64.cmp = icmp eq i32 %prol.iter64.sub, 0
  br i1 %prol.iter64.cmp, label %.prol.loopexit61.loopexit, label %.prol.preheader60, !llvm.loop !3

.prol.loopexit61.loopexit:                        ; preds = %.prol.preheader60
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.loopexit61.loopexit, %.lr.ph11.us
  %indvars.iv45.unr = phi i64 [ 0, %.lr.ph11.us ], [ %16, %.prol.loopexit61.loopexit ]
  br i1 %13, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit61
  br label %.lr.ph11.us.new

.preheader6:                                      ; preds = %.preheader6, %.preheader6.preheader.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr, %.preheader6.preheader.new ], [ %indvars.iv.next30.7, %.preheader6 ]
  %indvars.iv.next30.7 = add nsw i64 %indvars.iv29, 8
  %exitcond32.7 = icmp eq i64 %indvars.iv.next30.7, %wide.trip.count51
  br i1 %exitcond32.7, label %._crit_edge14.loopexit67.unr-lcssa, label %.preheader6

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14.loopexit67.unr-lcssa:               ; preds = %.preheader6
  br label %._crit_edge14.loopexit67

._crit_edge14.loopexit67:                         ; preds = %.preheader6.prol.loopexit, %._crit_edge14.loopexit67.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit67, %._crit_edge14.loopexit, %.preheader7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge26.loopexit, label %.preheader7

._crit_edge26.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #2 {
.preheader3.us.preheader:
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %.preheader3.us.preheader, %._crit_edge7.us
  %indvars.iv29 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next30, %._crit_edge7.us ]
  br label %.preheader2.us.us.new

._crit_edge7.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 150
  br i1 %exitcond32, label %.preheader.us.new.preheader, label %.preheader2.us.us.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge7.us
  br label %.preheader.us.new

.preheader2.us.us.new:                            ; preds = %.preheader2.us.us.preheader, %._crit_edge6.us.us
  %indvars.iv25 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next26, %._crit_edge6.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv29, %indvars.iv25
  br label %3

._crit_edge6.us.us:                               ; preds = %3
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 140
  br i1 %exitcond28, label %._crit_edge7.us, label %.preheader2.us.us.new

; <label>:3:                                      ; preds = %3, %.preheader2.us.us.new
  %indvars.iv21 = phi i64 [ 0, %.preheader2.us.us.new ], [ %indvars.iv.next22.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv21
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv29, i64 %indvars.iv25, i64 %indvars.iv21
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next22
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22.1, 160
  br i1 %exitcond24.1, label %._crit_edge6.us.us, label %3

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv16, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv16, %indvars.iv.next
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
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 160
  br i1 %exitcond19, label %._crit_edge4, label %.preheader.us.new

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader1.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader1.us.preheader, %._crit_edge3.us
  %indvars.iv19 = phi i64 [ 0, %.preheader1.us.preheader ], [ %indvars.iv.next20, %._crit_edge3.us ]
  %5 = mul nuw nsw i64 %indvars.iv19, 140
  br label %.preheader.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge2.us.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 150
  br i1 %exitcond22, label %._crit_edge4, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge2.us.us, %.preheader.us.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next16, %._crit_edge2.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv15
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge2.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 140
  br i1 %exitcond18, label %._crit_edge3.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv19, i64 %indvars.iv15, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond14, label %._crit_edge2.us.us, label %8

._crit_edge4:                                     ; preds = %._crit_edge3.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
