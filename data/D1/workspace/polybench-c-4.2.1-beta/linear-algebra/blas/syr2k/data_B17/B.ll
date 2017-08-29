; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next22, %._crit_edge11.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader4.us
  %indvars.iv18 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next19, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv18, %indvars.iv21
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv18
  %12 = add nuw nsw i64 %6, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.000000e+03>
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %11, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv18
  store double %20, double* %21, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond20, label %._crit_edge11.us, label %5

._crit_edge11.us:                                 ; preds = %5
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond23, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %22 ]
  %23 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %24 = add nuw nsw i64 %23, 3
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1200
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  store double %28, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.us.preheader:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = insertelement <2 x double> undef, double %1, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  %7 = insertelement <2 x double> undef, double %1, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv
  %10 = bitcast double* %9 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %12 = fmul <2 x double> %11, %6
  %13 = bitcast double* %9 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next.1
  %15 = bitcast double* %14 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %17 = fmul <2 x double> %16, %8
  %18 = bitcast double* %14 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv34
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph ], [ %indvars.iv25.ph, %scalar.ph.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv30
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %0
  %22 = load double, double* %34, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv30
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %0
  %27 = load double, double* %35, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv25
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv34
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph, !llvm.loop !1

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv30
  %33 = add i64 %indvars.iv30, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %33
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv30
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %33
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv30
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us15 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us15
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %35
  %bound1 = icmp ult double* %35, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %34
  %bound123 = icmp ult double* %34, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %36 = or i64 %index, 1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv30
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %36, i64 %indvars.iv30
  %39 = load double, double* %37, align 8, !alias.scope !4
  %40 = load double, double* %38, align 8, !alias.scope !4
  %41 = insertelement <2 x double> undef, double %39, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %42, %broadcast.splat27
  %44 = load double, double* %34, align 8, !alias.scope !7
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %43, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv30
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %36, i64 %indvars.iv30
  %50 = load double, double* %48, align 8, !alias.scope !9
  %51 = load double, double* %49, align 8, !alias.scope !9
  %52 = insertelement <2 x double> undef, double %50, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %53, %broadcast.splat27
  %55 = load double, double* %35, align 8, !alias.scope !11
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %54, %57
  %59 = fadd <2 x double> %47, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !13, !noalias !15
  %62 = fadd <2 x double> %wide.load, %59
  %63 = bitcast double* %60 to <2 x double>*
  store <2 x double> %62, <2 x double>* %63, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us18, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.preheader4.us.preheader, %._crit_edge9.us
  %indvars.iv36 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us ]
  %indvars.iv34 = phi i64 [ 1, %.preheader4.us.preheader ], [ %indvars.iv.next35, %._crit_edge9.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 0
  %65 = mul i64 %indvars.iv36, 1201
  %66 = add i64 %65, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %66
  %67 = add i64 %indvars.iv36, 1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %68 = trunc i64 %indvars.iv.next37 to i32
  %xtraiter = and i32 %68, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.prol
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %1
  store double %71, double* %69, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !17

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %72 = icmp ult i64 %indvars.iv36, 3
  br i1 %72, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %67, 2
  %n.vec = and i64 %67, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %67, %n.vec
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond32, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond38, label %._crit_edge13, label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12}
!12 = distinct !{!12, !6}
!13 = !{!14}
!14 = distinct !{!14, !6}
!15 = !{!12, !5, !10, !8}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
