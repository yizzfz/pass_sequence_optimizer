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
  br i1 %8, label %.preheader2.lr.ph, label %._crit_edge26

.preheader2.lr.ph:                                ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %11 = add i32 %2, -1
  %12 = and i32 %2, 3
  %13 = add nsw i32 %12, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = zext i32 %1 to i64
  %17 = zext i32 %2 to i64
  %xtraiter57 = and i32 %2, 3
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  %18 = icmp ult i32 %11, 3
  %xtraiter43 = and i32 %2, 1
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  %19 = icmp eq i32 %11, 0
  %20 = add nsw i64 %16, -1
  %xtraiter = and i64 %16, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %21 = icmp ult i64 %20, 7
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.lr.ph, %._crit_edge14
  %22 = phi i32 [ 0, %.preheader2.lr.ph ], [ %72, %._crit_edge14 ]
  br i1 %9, label %.preheader1.lr.ph, label %._crit_edge14

.preheader1.lr.ph:                                ; preds = %.preheader2
  %23 = sext i32 %22 to i64
  br i1 %10, label %.preheader1.us.preheader, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.lr.ph
  br i1 %lcmp.mod, label %.preheader1.prol.loopexit, label %.preheader1.prol.preheader

.preheader1.prol.preheader:                       ; preds = %.preheader1.preheader
  br label %.preheader1.prol

.preheader1.prol:                                 ; preds = %.preheader1.prol, %.preheader1.prol.preheader
  %indvars.iv30.prol = phi i64 [ %indvars.iv.next31.prol, %.preheader1.prol ], [ 0, %.preheader1.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader1.prol ], [ %xtraiter, %.preheader1.prol.preheader ]
  %indvars.iv.next31.prol = add nuw nsw i64 %indvars.iv30.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader1.prol.loopexit.unr-lcssa, label %.preheader1.prol, !llvm.loop !1

.preheader1.prol.loopexit.unr-lcssa:              ; preds = %.preheader1.prol
  br label %.preheader1.prol.loopexit

.preheader1.prol.loopexit:                        ; preds = %.preheader1.preheader, %.preheader1.prol.loopexit.unr-lcssa
  %indvars.iv30.unr = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next31.prol, %.preheader1.prol.loopexit.unr-lcssa ]
  br i1 %21, label %._crit_edge14.loopexit68, label %.preheader1.preheader.new

.preheader1.preheader.new:                        ; preds = %.preheader1.prol.loopexit
  br label %.preheader1

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge13.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge13.us ], [ 0, %.preheader1.us.preheader ]
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 0
  br label %.lr.ph.us.us

._crit_edge13.us.loopexit:                        ; preds = %.lr.ph12.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit56
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, %16
  br i1 %exitcond65, label %._crit_edge14.loopexit, label %.preheader1.us

.lr.ph12.us.new:                                  ; preds = %.lr.ph12.us.new.preheader, %.lr.ph12.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.3, %.lr.ph12.us.new ], [ %indvars.iv49.unr, %.lr.ph12.us.new.preheader ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv49
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv49
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next50
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv.next50
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next50.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv.next50.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next50.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv.next50.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  %exitcond52.3 = icmp eq i64 %indvars.iv.next50.3, %17
  br i1 %exitcond52.3, label %._crit_edge13.us.loopexit, label %.lr.ph12.us.new

.lr.ph.us.us:                                     ; preds = %.preheader1.us, %._crit_edge.us.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us.us ], [ 0, %.preheader1.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv45
  store double 0.000000e+00, double* %45, align 8
  %sunkaddr5.us.us = shl nsw i64 %indvars.iv45, 3
  %sunkaddr6.us.us = add i64 %sunkaddr, %sunkaddr5.us.us
  %sunkaddr7.us.us = inttoptr i64 %sunkaddr6.us.us to double*
  br i1 %lcmp.mod44, label %.prol.loopexit42, label %.prol.preheader41

.prol.preheader41:                                ; preds = %.lr.ph.us.us
  %46 = load double, double* %24, align 8
  %47 = load [160 x double]*, [160 x double]** %7, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %47, i64 0, i64 %indvars.iv45
  %49 = load double, double* %48, align 8
  %50 = fmul double %46, %49
  %51 = fadd double %50, 0.000000e+00
  store double %51, double* %sunkaddr7.us.us, align 8
  br label %.prol.loopexit42

.prol.loopexit42:                                 ; preds = %.prol.preheader41, %.lr.ph.us.us
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader41 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %51, %.prol.preheader41 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %19, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit42
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit42
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %17
  br i1 %exitcond, label %.lr.ph12.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %52 = phi double [ %66, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv37
  %54 = load double, double* %53, align 8
  %55 = load [160 x double]*, [160 x double]** %7, align 8
  %56 = getelementptr inbounds [160 x double], [160 x double]* %55, i64 %indvars.iv37, i64 %indvars.iv45
  %57 = load double, double* %56, align 8
  %58 = fmul double %54, %57
  %59 = fadd double %52, %58
  store double %59, double* %sunkaddr7.us.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv.next38
  %61 = load double, double* %60, align 8
  %62 = load [160 x double]*, [160 x double]** %7, align 8
  %63 = getelementptr inbounds [160 x double], [160 x double]* %62, i64 %indvars.iv.next38, i64 %indvars.iv45
  %64 = load double, double* %63, align 8
  %65 = fmul double %61, %64
  %66 = fadd double %59, %65
  store double %66, double* %sunkaddr7.us.us, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv37, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next38.1, %17
  br i1 %exitcond40.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph12.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod58, label %.prol.loopexit56, label %.prol.preheader55.preheader

.prol.preheader55.preheader:                      ; preds = %.lr.ph12.us
  br label %.prol.preheader55

.prol.preheader55:                                ; preds = %.prol.preheader55.preheader, %.prol.preheader55
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %.prol.preheader55 ], [ 0, %.prol.preheader55.preheader ]
  %prol.iter59 = phi i32 [ %prol.iter59.sub, %.prol.preheader55 ], [ %xtraiter57, %.prol.preheader55.preheader ]
  %67 = getelementptr inbounds double, double* %5, i64 %indvars.iv49.prol
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %23, i64 %indvars.iv60, i64 %indvars.iv49.prol
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.prol, 1
  %prol.iter59.sub = add nsw i32 %prol.iter59, -1
  %prol.iter59.cmp = icmp eq i32 %prol.iter59.sub, 0
  br i1 %prol.iter59.cmp, label %.prol.loopexit56.loopexit, label %.prol.preheader55, !llvm.loop !3

.prol.loopexit56.loopexit:                        ; preds = %.prol.preheader55
  br label %.prol.loopexit56

.prol.loopexit56:                                 ; preds = %.prol.loopexit56.loopexit, %.lr.ph12.us
  %indvars.iv49.unr = phi i64 [ 0, %.lr.ph12.us ], [ %15, %.prol.loopexit56.loopexit ]
  br i1 %18, label %._crit_edge13.us, label %.lr.ph12.us.new.preheader

.lr.ph12.us.new.preheader:                        ; preds = %.prol.loopexit56
  br label %.lr.ph12.us.new

.preheader1:                                      ; preds = %.preheader1, %.preheader1.preheader.new
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr, %.preheader1.preheader.new ], [ %indvars.iv.next31.7, %.preheader1 ]
  %indvars.iv.next31.7 = add nsw i64 %indvars.iv30, 8
  %exitcond64.7 = icmp eq i64 %indvars.iv.next31.7, %16
  br i1 %exitcond64.7, label %._crit_edge14.loopexit68.unr-lcssa, label %.preheader1

._crit_edge14.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge14

._crit_edge14.loopexit68.unr-lcssa:               ; preds = %.preheader1
  br label %._crit_edge14.loopexit68

._crit_edge14.loopexit68:                         ; preds = %.preheader1.prol.loopexit, %._crit_edge14.loopexit68.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit68, %._crit_edge14.loopexit, %.preheader2
  %72 = add nsw i32 %22, 1
  %73 = icmp slt i32 %72, %0
  br i1 %73, label %.preheader2, label %._crit_edge26.loopexit

._crit_edge26.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader3.lr.ph:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us, %.preheader3.lr.ph
  %indvars.iv31 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next32, %._crit_edge7.us ]
  br label %.preheader2.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next32, 150
  br i1 %exitcond37, label %.preheader.us.preheader, label %.preheader3.us

.preheader.us.preheader:                          ; preds = %._crit_edge7.us
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %.preheader3.us, %._crit_edge6.us.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge6.us.us ], [ 0, %.preheader3.us ]
  %5 = mul nuw nsw i64 %indvars.iv27, %indvars.iv31
  br label %.preheader2.us.us.new

._crit_edge6.us.us:                               ; preds = %.preheader2.us.us.new
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, 140
  br i1 %exitcond, label %._crit_edge7.us, label %.preheader2.us.us

.preheader2.us.us.new:                            ; preds = %.preheader2.us.us, %.preheader2.us.us.new
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %.preheader2.us.us.new ], [ 0, %.preheader2.us.us ]
  %6 = add nsw i64 %indvars.iv19, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv27, i64 %indvars.iv19
  %indvars.iv.next20 = or i64 %indvars.iv19, 1
  %11 = add nsw i64 %indvars.iv.next20, %5
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next20.1 = add nuw nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, 160
  br i1 %exitcond22.1, label %._crit_edge6.us.us, label %.preheader2.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next16, 160
  br i1 %exitcond36, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader1.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge3.us, %.preheader1.lr.ph
  %indvars.iv18 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next19, %._crit_edge3.us ]
  %8 = mul nsw i64 %indvars.iv18, 140
  br label %.preheader.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge2.us.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, 150
  br i1 %exitcond24, label %._crit_edge4, label %.preheader1.us

.preheader.us.us:                                 ; preds = %.preheader1.us, %._crit_edge2.us.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge2.us.us ], [ 0, %.preheader1.us ]
  %9 = add i64 %indvars.iv14, %8
  %10 = mul i64 %9, 160
  br label %11

._crit_edge2.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 140
  br i1 %exitcond, label %._crit_edge3.us, label %.preheader.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %16, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv18, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond23, label %._crit_edge2.us.us, label %11

._crit_edge4:                                     ; preds = %._crit_edge3.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
