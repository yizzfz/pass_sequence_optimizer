; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %15
  br label %._crit_edge

; <label>:18:                                     ; preds = %15
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader7.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge22.us..preheader7.us_crit_edge, %.preheader7.lr.ph
  %indvars.iv44 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next45, %._crit_edge22.us..preheader7.us_crit_edge ]
  %7 = add i64 %indvars.iv44, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %._crit_edge48, %.preheader7.us
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %._crit_edge48 ]
  %10 = add nsw i64 %indvars.iv44, %indvars.iv42
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv42
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv42 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv42
  store double %20, double* %21, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %22 = icmp slt i64 %indvars.iv.next43, 1200
  br i1 %22, label %._crit_edge48, label %._crit_edge22.us

._crit_edge48:                                    ; preds = %9
  br label %9

._crit_edge22.us:                                 ; preds = %9
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %23 = icmp slt i64 %indvars.iv.next45, 1000
  br i1 %23, label %._crit_edge22.us..preheader7.us_crit_edge, label %.preheader5.preheader

._crit_edge22.us..preheader7.us_crit_edge:        ; preds = %._crit_edge22.us
  br label %.preheader7.us

.preheader5.preheader:                            ; preds = %._crit_edge22.us
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge..preheader5_crit_edge ], [ 1, %.preheader5.preheader ]
  %indvars.iv33 = phi i32 [ %indvars.iv.next34, %._crit_edge..preheader5_crit_edge ], [ 1, %.preheader5.preheader ]
  %24 = sub i32 1007, %indvar
  %25 = sub i32 998, %indvar
  %26 = icmp slt i64 %indvars.iv40, 0
  br i1 %26, label %.preheader5..preheader_crit_edge, label %.lr.ph.preheader

.preheader5..preheader_crit_edge:                 ; preds = %.preheader5
  br label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  %27 = and i64 %indvars.iv40, 1
  %lcmp.mod47 = icmp eq i64 %27, 0
  br i1 %lcmp.mod47, label %.lr.ph.prol.preheader, label %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge

.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %28 = trunc i64 %indvars.iv40 to i32
  %29 = srem i32 %28, 100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 0
  store double %31, double* %32, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %indvars.iv40, 0
  br i1 %33, label %.lr.ph.prol.loopexit..preheader.loopexit_crit_edge, label %.lr.ph.preheader.new

.lr.ph.prol.loopexit..preheader.loopexit_crit_edge: ; preds = %.lr.ph.prol.loopexit
  br label %.preheader.loopexit

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit..preheader.loopexit_crit_edge, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader5..preheader_crit_edge, %.preheader.loopexit
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %34 = icmp slt i64 %indvars.iv.next41, 1000
  br i1 %34, label %.lr.ph13, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter = and i32 %24, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph13..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph13..prol.loopexit_crit_edge:                ; preds = %.lr.ph13
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader..prol.preheader_crit_edge ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %35, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph13..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13..prol.loopexit_crit_edge ], [ %indvars.iv.next38.prol, %.prol.loopexit.loopexit ]
  %36 = icmp ult i32 %25, 7
  br i1 %36, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph13.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph..lr.ph_crit_edge ]
  %37 = add nsw i64 %indvars.iv40, %indvars.iv
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.000000e+03
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new..lr.ph13.new_crit_edge, %.lr.ph13.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new..lr.ph13.new_crit_edge ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %50, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %52, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %54, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %56, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new..lr.ph13.new_crit_edge

.lr.ph13.new..lr.ph13.new_crit_edge:              ; preds = %.lr.ph13.new
  br label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %34, label %._crit_edge..preheader5_crit_edge, label %._crit_edge16

._crit_edge..preheader5_crit_edge:                ; preds = %._crit_edge
  br label %.preheader5

._crit_edge16:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge8..preheader_crit_edge, %.preheader.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next37, %._crit_edge8..preheader_crit_edge ]
  %indvars.iv34 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8..preheader_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 0
  %8 = add i64 %indvars.iv36, 1
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv36, 0
  br i1 %9, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.preheader
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  %bound049 = icmp ult double* %scevgep, %10
  %bound150 = icmp ult double* %10, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader62, label %vector.ph

.lr.ph7.split.preheader62:                        ; preds = %.lr.ph7.split.preheader
  br label %.lr.ph7.split

vector.ph:                                        ; preds = %.lr.ph7.split.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !3, !noalias !6
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !3, !noalias !6
  %15 = fmul <2 x double> %wide.load, %broadcast.splat55
  %16 = fmul <2 x double> %wide.load53, %broadcast.splat55
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !9
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !9
  %21 = fmul <2 x double> %wide.load56, %broadcast.splat59
  %22 = fmul <2 x double> %wide.load57, %broadcast.splat59
  %23 = load double, double* %10, align 8, !alias.scope !10
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %30, %broadcast.splat61
  %33 = fadd <2 x double> %31, %broadcast.splat61
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !3, !noalias !6
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge8.loopexit64, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.lr.ph7.split.us.preheader:                       ; preds = %.preheader
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us..lr.ph7.split.us_crit_edge, %.lr.ph7.split.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us..lr.ph7.split.us_crit_edge ], [ 0, %.lr.ph7.split.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  br label %39

; <label>:39:                                     ; preds = %._crit_edge, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %._crit_edge ]
  %40 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %53, %._crit_edge ]
  %41 = load double, double* %38, align 8
  %42 = fmul double %41, %2
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv26
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv32
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  store double %48, double* %46, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv32
  %50 = load double, double* %49, align 8
  %51 = load double, double* %43, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %40, %52
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %39
  br label %39

._crit_edge.us:                                   ; preds = %39
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv32
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = load double, double* %38, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %37, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %56, %60
  %62 = fmul double %53, %2
  %63 = fadd double %61, %62
  store double %63, double* %54, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %64 = icmp slt i64 %indvars.iv.next33, 1200
  br i1 %64, label %._crit_edge.us..lr.ph7.split.us_crit_edge, label %._crit_edge8.loopexit

._crit_edge.us..lr.ph7.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph7.split.us

.lr.ph7.split:                                    ; preds = %.lr.ph7.split..lr.ph7.split_crit_edge, %.lr.ph7.split.preheader62
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.preheader62 ], [ %indvars.iv.next.1, %.lr.ph7.split..lr.ph7.split_crit_edge ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %10, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fadd double %73, %7
  store double %74, double* %65, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %3
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv.next
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %2
  %81 = load double, double* %10, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %77, %82
  %84 = fadd double %83, %7
  store double %84, double* %75, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %85 = icmp slt i64 %indvars.iv.next.1, 1200
  br i1 %85, label %.lr.ph7.split..lr.ph7.split_crit_edge, label %._crit_edge8.loopexit63, !llvm.loop !14

.lr.ph7.split..lr.ph7.split_crit_edge:            ; preds = %.lr.ph7.split
  br label %.lr.ph7.split

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8.loopexit64:                          ; preds = %vector.body
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit64, %._crit_edge8.loopexit63, %._crit_edge8.loopexit
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %86 = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %86, label %._crit_edge8..preheader_crit_edge, label %._crit_edge14

._crit_edge8..preheader_crit_edge:                ; preds = %._crit_edge8
  br label %.preheader

._crit_edge14:                                    ; preds = %._crit_edge8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv11 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next12, %._crit_edge.us..preheader.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv11, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %9 = add nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13

._crit_edge13:                                    ; preds = %15
  br label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %20 = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %20, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge4

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
