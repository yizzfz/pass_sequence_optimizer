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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader26.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge33.us, %.preheader26.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader26.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader26.us
  %indvars.iv41 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next42, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv41
  %14 = add nuw nsw i64 %8, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %12, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fdiv <2 x double> %19, <double 1.200000e+03, double 1.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv41
  store double %22, double* %23, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond44, label %._crit_edge33.us, label %7

._crit_edge33.us:                                 ; preds = %7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond48, label %.preheader.us.preheader, label %.preheader26.us

.preheader.us.preheader:                          ; preds = %._crit_edge33.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv37
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond40, label %._crit_edge30, label %.preheader.us

._crit_edge30:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader32.us.preheader:
  %broadcast.splatinsert132 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat133 = shufflevector <2 x double> %broadcast.splatinsert132, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert111 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat112 = shufflevector <2 x double> %broadcast.splatinsert111, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader135, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader135 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %3
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv64
  br i1 %exitcond.3, label %.preheader.us42.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us42.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us42.preheader

.preheader.us42.preheader:                        ; preds = %.preheader.us42.preheader.loopexit, %middle.block114, %.prol.loopexit
  %min.iters.check = icmp ult i64 %65, 2
  %n.vec = and i64 %65, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %65, %n.vec
  br label %.preheader.us42

.preheader.us42:                                  ; preds = %.preheader.us42.preheader, %._crit_edge.us46
  %indvars.iv59 = phi i64 [ %19, %._crit_edge.us46 ], [ 0, %.preheader.us42.preheader ]
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %19 = add i64 %indvars.iv59, 1
  %scevgep91 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %19
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv59
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %19
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv59
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv59
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us42
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %21
  %bound1 = icmp ult double* %21, %scevgep87
  %found.conflict = and i1 %bound0, %bound1
  %bound098 = icmp ult double* %scevgep, %scevgep91
  %bound199 = icmp ult double* %scevgep89, %scevgep87
  %found.conflict100 = and i1 %bound098, %bound199
  %conflict.rdx = or i1 %found.conflict, %found.conflict100
  %bound0101 = icmp ult double* %scevgep, %scevgep95
  %bound1102 = icmp ult double* %scevgep93, %scevgep87
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx104 = or i1 %conflict.rdx, %found.conflict103
  %bound0107 = icmp ult double* %scevgep, %20
  %bound1108 = icmp ult double* %20, %scevgep87
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %conflict.rdx104, %found.conflict109
  br i1 %conflict.rdx110, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %20, align 8, !alias.scope !5
  %.pre134 = load double, double* %21, align 8, !alias.scope !8
  %22 = insertelement <2 x double> undef, double %.pre, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = insertelement <2 x double> undef, double %.pre134, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = or i64 %index, 1
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv59
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %26, i64 %indvars.iv59
  %29 = load double, double* %27, align 8, !alias.scope !10
  %30 = load double, double* %28, align 8, !alias.scope !10
  %31 = insertelement <2 x double> undef, double %29, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %32, %broadcast.splat112
  %34 = fmul <2 x double> %33, %23
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv59
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %26, i64 %indvars.iv59
  %37 = load double, double* %35, align 8, !alias.scope !12
  %38 = load double, double* %36, align 8, !alias.scope !12
  %39 = insertelement <2 x double> undef, double %37, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %40, %broadcast.splat112
  %42 = fmul <2 x double> %41, %25
  %43 = fadd <2 x double> %34, %42
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !14, !noalias !16
  %46 = fadd <2 x double> %wide.load, %43
  store <2 x double> %46, <2 x double>* %45, align 8, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 2
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us46, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us42
  %indvars.iv53.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us42 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph ], [ %indvars.iv53.ph, %scalar.ph.preheader ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv59
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %2
  %51 = load double, double* %20, align 8
  %52 = fmul double %50, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv59
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %2
  %56 = load double, double* %21, align 8
  %57 = fmul double %55, %56
  %58 = fadd double %52, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv53
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv64
  br i1 %exitcond58, label %._crit_edge.us46.loopexit, label %scalar.ph, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.preheader32.us.preheader, %._crit_edge37.us
  %indvars.iv66 = phi i64 [ 0, %.preheader32.us.preheader ], [ %65, %._crit_edge37.us ]
  %indvars.iv64 = phi i64 [ 1, %.preheader32.us.preheader ], [ %indvars.iv.next65, %._crit_edge37.us ]
  %62 = add i64 %indvars.iv66, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 0
  %63 = mul i64 %indvars.iv66, 1201
  %64 = add i64 %63, 1
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %64
  %65 = add i64 %indvars.iv66, 1
  %xtraiter = and i64 %65, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.prol
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %3
  store double %68, double* %66, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %69 = icmp ult i64 %indvars.iv66, 3
  br i1 %69, label %.preheader.us42.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %70 = sub i64 %62, %indvars.iv.unr
  %71 = lshr i64 %70, 2
  %72 = add nuw nsw i64 %71, 1
  %min.iters.check116 = icmp ult i64 %72, 2
  br i1 %min.iters.check116, label %.lr.ph.us.new.preheader135, label %min.iters.checked117

.lr.ph.us.new.preheader135:                       ; preds = %middle.block114, %min.iters.checked117, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked117 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end, %middle.block114 ]
  br label %.lr.ph.us.new

min.iters.checked117:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf118 = and i64 %72, 1
  %n.vec119 = sub nsw i64 %72, %n.mod.vf118
  %cmp.zero120 = icmp eq i64 %n.vec119, 0
  %73 = add i64 %indvars.iv.unr, 4
  %74 = shl nuw i64 %71, 2
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf118, 2
  %ind.end = sub i64 %75, %76
  br i1 %cmp.zero120, label %.lr.ph.us.new.preheader135, label %vector.ph121

vector.ph121:                                     ; preds = %min.iters.checked117
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113, %vector.ph121
  %index122 = phi i64 [ 0, %vector.ph121 ], [ %index.next123, %vector.body113 ]
  %77 = shl i64 %index122, 2
  %78 = add i64 %indvars.iv.unr, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %78
  %80 = bitcast double* %79 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %80, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec129 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec130 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec131 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %81 = fmul <2 x double> %strided.vec, %broadcast.splat133
  %82 = fmul <2 x double> %strided.vec129, %broadcast.splat133
  %83 = fmul <2 x double> %strided.vec130, %broadcast.splat133
  %84 = add nsw i64 %78, 3
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %84
  %86 = fmul <2 x double> %strided.vec131, %broadcast.splat133
  %87 = getelementptr double, double* %85, i64 -3
  %88 = bitcast double* %87 to <8 x double>*
  %89 = shufflevector <2 x double> %81, <2 x double> %82, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %90 = shufflevector <2 x double> %83, <2 x double> %86, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %89, <4 x double> %90, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %88, align 8
  %index.next123 = add i64 %index122, 2
  %91 = icmp eq i64 %index.next123, %n.vec119
  br i1 %91, label %middle.block114, label %vector.body113, !llvm.loop !21

middle.block114:                                  ; preds = %vector.body113
  %cmp.n125 = icmp eq i64 %n.mod.vf118, 0
  br i1 %cmp.n125, label %.preheader.us42.preheader, label %.lr.ph.us.new.preheader135

._crit_edge.us46.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us46

._crit_edge.us46:                                 ; preds = %._crit_edge.us46.loopexit, %middle.block
  %exitcond62 = icmp eq i64 %19, 1000
  br i1 %exitcond62, label %._crit_edge37.us, label %.preheader.us42

._crit_edge37.us:                                 ; preds = %._crit_edge.us46
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %65, 1200
  br i1 %exitcond69, label %._crit_edge41, label %.lr.ph.us

._crit_edge41:                                    ; preds = %._crit_edge37.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv12, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nsw i64 %indvars.iv, %6
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
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond15, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!9, !11, !13, !6}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
