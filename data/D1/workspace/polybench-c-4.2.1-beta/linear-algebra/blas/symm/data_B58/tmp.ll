; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [1000 x [1200 x double]]*, align 8
  %10 = alloca [1000 x [1000 x double]]*, align 8
  %11 = alloca [1000 x [1200 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1000, i32* %5, align 4
  store i32 1200, i32* %6, align 4
  %12 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %13 = bitcast [1000 x [1200 x double]]** %9 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %15 = bitcast [1000 x [1000 x double]]** %10 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %17 = bitcast [1000 x [1200 x double]]** %11 to i8**
  store i8* %16, i8** %17, align 8
  %18 = load i32, i32* %5, align 4
  %19 = load i32, i32* %6, align 4
  %20 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %21 = load [1200 x double]*, [1200 x double]** %20, align 8
  %22 = bitcast [1000 x [1000 x double]]** %10 to [1000 x double]**
  %23 = load [1000 x double]*, [1000 x double]** %22, align 8
  %24 = bitcast i8* %16 to [1200 x double]*
  call fastcc void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %24)
  call void (...) @polybench_timer_start() #4
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %6, align 4
  %27 = load double, double* %7, align 8
  %28 = load double, double* %8, align 8
  %29 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %30 = load [1200 x double]*, [1200 x double]** %29, align 8
  %31 = bitcast [1000 x [1000 x double]]** %10 to [1000 x double]**
  %32 = load [1000 x double]*, [1000 x double]** %31, align 8
  %33 = bitcast [1000 x [1200 x double]]** %11 to [1200 x double]**
  %34 = load [1200 x double]*, [1200 x double]** %33, align 8
  call fastcc void @kernel_symm(i32 %25, i32 %26, double %27, double %28, [1200 x double]* %30, [1000 x double]* %32, [1200 x double]* %34)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %35 = load i32, i32* %3, align 4
  %36 = icmp sgt i32 %35, 42
  br i1 %36, label %37, label %._crit_edge

; <label>:37:                                     ; preds = %2
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %strcmpload = load i8, i8* %39, align 1
  %40 = icmp eq i8 %strcmpload, 0
  br i1 %40, label %41, label %._crit_edge

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %5, align 4
  %43 = load i32, i32* %6, align 4
  %44 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %45 = load [1200 x double]*, [1200 x double]** %44, align 8
  call fastcc void @print_array(i32 %42, i32 %43, [1200 x double]* %45)
  br label %._crit_edge

._crit_edge:                                      ; preds = %37, %2, %41
  %46 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %47 = load i8*, i8** %46, align 8
  call void @free(i8* %47) #4
  %48 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %49 = load i8*, i8** %48, align 8
  call void @free(i8* %49) #4
  %50 = bitcast [1000 x [1200 x double]]** %11 to i8**
  %51 = load i8*, i8** %50, align 8
  call void @free(i8* %51) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca [1000 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store [1000 x double]* %5, [1000 x double]** %11, align 8
  store [1200 x double]* %6, [1200 x double]** %12, align 8
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  store i32 0, i32* %13, align 4
  %14 = load i32, i32* %8, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader7.lr.ph, label %.preheader6.thread

.preheader6.thread:                               ; preds = %7
  store i32 0, i32* %13, align 4
  br label %.preheader6._crit_edge

.preheader7.lr.ph:                                ; preds = %7
  %16 = load i32, i32* %9, align 4
  %17 = zext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load i32, i32* %8, align 4
  %20 = sext i32 %19 to i64
  %21 = sitofp i32 %19 to double
  %22 = load [1200 x double]*, [1200 x double]** %10, align 8
  %23 = sitofp i32 %19 to double
  %24 = load [1200 x double]*, [1200 x double]** %12, align 8
  br i1 %18, label %.preheader7.us.preheader, label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %.promoted26 = load i32, i32* %13, align 4
  %25 = sext i32 %.promoted26 to i64
  %26 = load i32, i32* %9, align 4
  %27 = sext i32 %26 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge22.us, %.preheader7.us.preheader
  %indvars.iv44 = phi i64 [ %25, %.preheader7.us.preheader ], [ %indvars.iv.next45, %._crit_edge22.us ]
  %28 = add i64 %indvars.iv44, %17
  %29 = trunc i64 %28 to i32
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46, %.preheader7.us
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %._crit_edge46 ]
  %30 = add nsw i64 %indvars.iv44, %indvars.iv42
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %21
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv44, i64 %indvars.iv42
  store double %34, double* %35, align 8
  %36 = trunc i64 %indvars.iv42 to i32
  %37 = sub i32 %29, %36
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %23
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv44, i64 %indvars.iv42
  store double %40, double* %41, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %42 = icmp slt i64 %indvars.iv.next43, %27
  br i1 %42, label %._crit_edge46, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge46
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %43 = icmp slt i64 %indvars.iv.next45, %20
  br i1 %43, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %44 = icmp sgt i32 %.pr, 0
  br i1 %44, label %.preheader5.lr.ph, label %.preheader6._crit_edge

.preheader5.lr.ph:                                ; preds = %.preheader6
  %45 = load i32, i32* %8, align 4
  %46 = load [1000 x double]*, [1000 x double]** %11, align 8
  %47 = sitofp i32 %45 to double
  %.promoted = load i32, i32* %13, align 4
  %48 = add i32 %.promoted, 1
  %49 = sext i32 %48 to i64
  %50 = add i32 %45, 7
  %51 = sub i32 %50, %.promoted
  %52 = add i32 %45, -2
  %53 = sub i32 %52, %.promoted
  %54 = sext i32 %.promoted to i64
  %55 = sext i32 %45 to i64
  %56 = sext i32 %45 to i64
  %57 = insertelement <2 x double> undef, double %47, i32 0
  %58 = insertelement <2 x double> %57, double %47, i32 1
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge..preheader5_crit_edge, %.preheader5.lr.ph
  %indvars.iv40 = phi i64 [ %54, %.preheader5.lr.ph ], [ %indvars.iv.next41, %._crit_edge..preheader5_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge..preheader5_crit_edge ]
  %indvars.iv35 = phi i64 [ %49, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge..preheader5_crit_edge ]
  %indvars.iv33 = phi i32 [ %48, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge..preheader5_crit_edge ]
  %59 = add i32 %48, %indvar
  %60 = sub i32 %51, %indvar
  %61 = sub i32 %53, %indvar
  %62 = icmp slt i64 %indvars.iv40, 0
  br i1 %62, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  %63 = and i32 %59, 1
  %lcmp.mod48 = icmp eq i32 %63, 0
  br i1 %lcmp.mod48, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %64 = trunc i64 %indvars.iv40 to i32
  %65 = srem i32 %64, 100
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %47
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 0
  store double %67, double* %68, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %69 = icmp eq i32 %59, 1
  br i1 %69, label %.preheader.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %70 = icmp slt i64 %indvars.iv.next41, %56
  br i1 %70, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter = and i32 %60, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38.prol, %.prol.loopexit.loopexit ]
  %72 = icmp ult i32 %61, 7
  br i1 %72, label %._crit_edge, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %73 = add nsw i64 %indvars.iv40, %indvars.iv
  %74 = trunc i64 %73 to i32
  %75 = srem i32 %74, 100
  %76 = sitofp i32 %75 to double
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %79 = trunc i64 %78 to i32
  %80 = srem i32 %79, 100
  %81 = sitofp i32 %80 to double
  %82 = insertelement <2 x double> undef, double %76, i32 0
  %83 = insertelement <2 x double> %82, double %81, i32 1
  %84 = fdiv <2 x double> %83, %58
  %85 = bitcast double* %77 to <2 x double>*
  store <2 x double> %84, <2 x double>* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %92, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %93, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, %45
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %94 = icmp slt i64 %indvars.iv.next41, %55
  br i1 %94, label %._crit_edge..preheader5_crit_edge, label %._crit_edge16

._crit_edge..preheader5_crit_edge:                ; preds = %._crit_edge
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  br label %.preheader5

._crit_edge16:                                    ; preds = %._crit_edge
  %95 = trunc i64 %indvars.iv.next41 to i32
  store i32 %95, i32* %13, align 4
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6, %.preheader6.thread, %._crit_edge16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1200 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store double %3, double* %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1200 x double]* %6, [1200 x double]** %14, align 8
  store i32 0, i32* %15, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = load double, double* %11, align 8
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  %23 = load double, double* %10, align 8
  %24 = load [1200 x double]*, [1200 x double]** %14, align 8
  %25 = load [1000 x double]*, [1000 x double]** %13, align 8
  %26 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %16, align 4
  %.promoted18 = load i32, i32* %15, align 4
  %.promoted20 = load double, double* %17, align 8
  %27 = sext i32 %20 to i64
  %28 = sext i32 %20 to i64
  %29 = sext i32 %.promoted18 to i64
  %30 = sext i32 %26 to i64
  %31 = fmul double %23, 0.000000e+00
  %32 = icmp sgt i32 %20, 0
  %xtraiter = and i64 %27, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %33 = icmp eq i32 %20, 1
  %34 = insertelement <2 x double> undef, double %21, i32 0
  %35 = insertelement <2 x double> %34, double %21, i32 1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge8..preheader_crit_edge, %.preheader.lr.ph
  %indvars.iv36 = phi i64 [ %29, %.preheader.lr.ph ], [ %indvars.iv.next37, %._crit_edge8..preheader_crit_edge ]
  %indvars.iv34 = phi i32 [ %.promoted18, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8..preheader_crit_edge ]
  %.lcssa613.lcssa21 = phi double [ %.promoted20, %.preheader.lr.ph ], [ %.lcssa613.lcssa22, %._crit_edge8..preheader_crit_edge ]
  %.lcssa412.lcssa16 = phi i32 [ %.promoted, %.preheader.lr.ph ], [ %.lcssa412.lcssa17, %._crit_edge8..preheader_crit_edge ]
  br i1 %32, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %36 = icmp sgt i64 %indvars.iv36, 0
  br i1 %36, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv36
  br i1 %lcmp.mod, label %.lr.ph7.split.prol.loopexit.unr-lcssa, label %.lr.ph7.split.prol.preheader

.lr.ph7.split.prol.preheader:                     ; preds = %.lr.ph7.split.preheader
  br label %.lr.ph7.split.prol

.lr.ph7.split.prol:                               ; preds = %.lr.ph7.split.prol.preheader
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 0
  %39 = load double, double* %38, align 8
  %40 = fmul double %21, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 0
  %42 = load double, double* %41, align 8
  %43 = fmul double %23, %42
  %44 = load double, double* %37, align 8
  %45 = fmul double %43, %44
  %46 = fadd double %40, %45
  %47 = fadd double %46, %31
  store double %47, double* %38, align 8
  br label %.lr.ph7.split.prol.loopexit.unr-lcssa

.lr.ph7.split.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph7.split.preheader, %.lr.ph7.split.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph7.split.prol ], [ 0, %.lr.ph7.split.preheader ]
  br label %.lr.ph7.split.prol.loopexit

.lr.ph7.split.prol.loopexit:                      ; preds = %.lr.ph7.split.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge8.loopexit41, label %.lr.ph7.split.preheader.new

.lr.ph7.split.preheader.new:                      ; preds = %.lr.ph7.split.prol.loopexit
  br label %.lr.ph7.split

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv32 = phi i64 [ 0, %.lr.ph7.split.us.preheader ], [ %indvars.iv.next33, %._crit_edge.us ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %indvars.iv32
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %._crit_edge40 ]
  %50 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %64, %._crit_edge40 ]
  %51 = load double, double* %49, align 8
  %52 = fmul double %23, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv26
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv26, i64 %indvars.iv32
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  store double %58, double* %56, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv26, i64 %indvars.iv32
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv26
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %50, %63
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge40

._crit_edge.us:                                   ; preds = %._crit_edge40
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %indvars.iv32
  %66 = load double, double* %65, align 8
  %67 = fmul double %21, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %indvars.iv32
  %69 = load double, double* %68, align 8
  %70 = fmul double %23, %69
  %71 = load double, double* %48, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fmul double %23, %64
  %75 = fadd double %73, %74
  store double %75, double* %65, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %76 = icmp slt i64 %indvars.iv.next33, %28
  br i1 %76, label %.lr.ph7.split.us, label %._crit_edge8.loopexit

.lr.ph7.split:                                    ; preds = %.lr.ph7.split, %.lr.ph7.split.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph7.split.preheader.new ], [ %indvars.iv.next.1, %.lr.ph7.split ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %indvars.iv
  %78 = bitcast double* %77 to <2 x double>*
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %23, %80
  %82 = load double, double* %37, align 8
  %83 = fmul double %81, %82
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %indvars.iv.next
  %85 = load <2 x double>, <2 x double>* %78, align 8
  %86 = fmul <2 x double> %35, %85
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fadd double %87, %83
  %90 = fadd double %89, %31
  store double %90, double* %77, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %indvars.iv.next
  %92 = load double, double* %91, align 8
  %93 = fmul double %23, %92
  %94 = load double, double* %37, align 8
  %95 = fmul double %93, %94
  %96 = fadd double %88, %95
  %97 = fadd double %96, %31
  store double %97, double* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %98 = icmp slt i64 %indvars.iv.next.1, %27
  br i1 %98, label %.lr.ph7.split, label %._crit_edge8.loopexit41.unr-lcssa

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit41.unr-lcssa:                ; preds = %.lr.ph7.split
  br label %._crit_edge8.loopexit41

._crit_edge8.loopexit41:                          ; preds = %.lr.ph7.split.prol.loopexit, %._crit_edge8.loopexit41.unr-lcssa
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit41, %._crit_edge8.loopexit, %.preheader
  %.lcssa613.lcssa22 = phi double [ %.lcssa613.lcssa21, %.preheader ], [ %64, %._crit_edge8.loopexit ], [ 0.000000e+00, %._crit_edge8.loopexit41 ]
  %.lcssa412.lcssa17 = phi i32 [ %.lcssa412.lcssa16, %.preheader ], [ %indvars.iv34, %._crit_edge8.loopexit ], [ 0, %._crit_edge8.loopexit41 ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %99 = icmp slt i64 %indvars.iv.next37, %30
  br i1 %99, label %._crit_edge8..preheader_crit_edge, label %._crit_edge14

._crit_edge8..preheader_crit_edge:                ; preds = %._crit_edge8
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  br label %.preheader

._crit_edge14:                                    ; preds = %._crit_edge8
  %100 = trunc i64 %indvars.iv.next37 to i32
  store i32 %.lcssa412.lcssa17, i32* %16, align 4
  store i32 %100, i32* %15, align 4
  store double %.lcssa613.lcssa22, double* %17, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %wide.trip.count = zext i32 %14 to i64
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = sext i32 %16 to i64
  %19 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted5 = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %20 = sext i32 %.promoted5 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ %20, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %21 = mul nsw i64 %18, %indvars.iv11
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %22 = add nsw i64 %21, %indvars.iv
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge13

; <label>:26:                                     ; preds = %._crit_edge14
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %26
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv11, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %32 = icmp slt i64 %indvars.iv.next12, %17
  br i1 %32, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %33 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %34 = add i32 %.promoted5, 1
  %35 = icmp sgt i32 %16, %34
  %smax = select i1 %35, i32 %16, i32 %34
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %33, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %._crit_edge4
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
