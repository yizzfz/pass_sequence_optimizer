; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader4.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge11.us ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %8, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %19, double* %20, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge11.us, label %7

._crit_edge11.us:                                 ; preds = %7
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %21

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader4.us.preheader:
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat86 = shufflevector <2 x double> %broadcast.splatinsert85, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader108, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader108 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %3
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block88, %.prol.loopexit
  %min.iters.check = icmp ult i64 %68, 2
  %n.vec = and i64 %68, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %68, %n.vec
  br label %.preheader.us15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph ], [ %indvars.iv25.ph, %scalar.ph.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %34, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  %27 = load double, double* %35, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv36
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %scalar.ph, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %33 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %33
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %33
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us15 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us15
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %35
  %bound1 = icmp ult double* %35, %scevgep61
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep65
  %bound173 = icmp ult double* %scevgep63, %scevgep61
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %bound075 = icmp ult double* %scevgep, %scevgep69
  %bound176 = icmp ult double* %scevgep67, %scevgep61
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx78 = or i1 %conflict.rdx, %found.conflict77
  %bound081 = icmp ult double* %scevgep, %34
  %bound182 = icmp ult double* %34, %scevgep61
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx84 = or i1 %conflict.rdx78, %found.conflict83
  br i1 %conflict.rdx84, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %36 = load double, double* %34, align 8, !alias.scope !6
  %37 = insertelement <2 x double> undef, double %36, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = load double, double* %35, align 8, !alias.scope !9
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %42 = or i64 %index, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv31
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %42, i64 %indvars.iv31
  %45 = load double, double* %43, align 8, !alias.scope !11
  %46 = load double, double* %44, align 8, !alias.scope !11
  %47 = insertelement <2 x double> undef, double %45, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %48, %broadcast.splat86
  %50 = fmul <2 x double> %49, %38
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv31
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %42, i64 %indvars.iv31
  %53 = load double, double* %51, align 8, !alias.scope !13
  %54 = load double, double* %52, align 8, !alias.scope !13
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat86
  %58 = fmul <2 x double> %57, %41
  %59 = fadd <2 x double> %50, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !15, !noalias !17
  %62 = fadd <2 x double> %wide.load, %59
  %63 = bitcast double* %60 to <2 x double>*
  store <2 x double> %62, <2 x double>* %63, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us18, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.preheader4.us.preheader, %._crit_edge9.us
  %indvars.iv58 = phi i2 [ 1, %.preheader4.us.preheader ], [ %indvars.iv.next59, %._crit_edge9.us ]
  %indvars.iv38 = phi i64 [ 0, %.preheader4.us.preheader ], [ %70, %._crit_edge9.us ]
  %indvars.iv36 = phi i64 [ 1, %.preheader4.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us ]
  %65 = add nsw i64 %indvars.iv38, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %66 = mul nuw nsw i64 %indvars.iv38, 1201
  %67 = add nuw nsw i64 %66, 1
  %scevgep61 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %67
  %68 = add nuw nsw i64 %indvars.iv38, 1
  %69 = zext i2 %indvars.iv58 to i64
  %70 = add nuw nsw i64 %indvars.iv38, 1
  %xtraiter = and i64 %70, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %3
  store double %73, double* %71, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %69, %.prol.loopexit.loopexit ]
  %74 = icmp ult i64 %indvars.iv38, 3
  br i1 %74, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %75 = sub i64 %65, %indvars.iv.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check90 = icmp ult i64 %77, 2
  br i1 %min.iters.check90, label %.lr.ph.us.new.preheader108, label %min.iters.checked91

.lr.ph.us.new.preheader108:                       ; preds = %middle.block88, %min.iters.checked91, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked91 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end, %middle.block88 ]
  br label %.lr.ph.us.new

min.iters.checked91:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf92 = and i64 %77, 1
  %n.vec93 = sub nsw i64 %77, %n.mod.vf92
  %cmp.zero94 = icmp eq i64 %n.vec93, 0
  %78 = or i64 %indvars.iv.unr, 4
  %79 = shl nuw i64 %76, 2
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf92, 2
  %ind.end = sub i64 %80, %81
  br i1 %cmp.zero94, label %.lr.ph.us.new.preheader108, label %vector.ph95

vector.ph95:                                      ; preds = %min.iters.checked91
  br label %vector.body87

vector.body87:                                    ; preds = %vector.body87, %vector.ph95
  %index96 = phi i64 [ 0, %vector.ph95 ], [ %index.next97, %vector.body87 ]
  %82 = shl i64 %index96, 2
  %offset.idx = or i64 %indvars.iv.unr, %82
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %offset.idx
  %84 = bitcast double* %83 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %84, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec103 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec104 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec105 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %85 = fmul <2 x double> %strided.vec, %broadcast.splat107
  %86 = fmul <2 x double> %strided.vec103, %broadcast.splat107
  %87 = fmul <2 x double> %strided.vec104, %broadcast.splat107
  %88 = add nsw i64 %offset.idx, 3
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %88
  %90 = fmul <2 x double> %strided.vec105, %broadcast.splat107
  %91 = getelementptr double, double* %89, i64 -3
  %92 = bitcast double* %91 to <8 x double>*
  %93 = shufflevector <2 x double> %85, <2 x double> %86, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %94 = shufflevector <2 x double> %87, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %93, <4 x double> %94, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %92, align 8
  %index.next97 = add i64 %index96, 2
  %95 = icmp eq i64 %index.next97, %n.vec93
  br i1 %95, label %middle.block88, label %vector.body87, !llvm.loop !21

middle.block88:                                   ; preds = %vector.body87
  %cmp.n99 = icmp eq i64 %n.mod.vf92, 0
  br i1 %cmp.n99, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader108

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %70, 1200
  %indvars.iv.next59 = add i2 %indvars.iv58, 1
  br i1 %exitcond41, label %._crit_edge13, label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
