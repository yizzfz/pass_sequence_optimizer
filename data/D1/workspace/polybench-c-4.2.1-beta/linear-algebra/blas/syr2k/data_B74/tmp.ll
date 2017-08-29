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
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.preheader37.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader37.us

.preheader37.us:                                  ; preds = %.preheader37.lr.ph, %._crit_edge44.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge44.us ], [ 0, %.preheader37.lr.ph ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader37.us
  %indvars.iv52 = phi i64 [ 0, %.preheader37.us ], [ %indvars.iv.next53, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv52
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %8, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv52
  store double %19, double* %20, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond55, label %._crit_edge44.us, label %7

._crit_edge44.us:                                 ; preds = %7
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 1200
  br i1 %exitcond59, label %.preheader.us.preheader, label %.preheader37.us

.preheader.us.preheader:                          ; preds = %._crit_edge44.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv48
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %21

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond51, label %._crit_edge41, label %.preheader.us

._crit_edge41:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.preheader35.lr.ph:
  %broadcast.splatinsert115 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat116 = shufflevector <2 x double> %broadcast.splatinsert115, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat137 = shufflevector <2 x double> %broadcast.splatinsert136, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader138, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader138 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %3
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv66
  br i1 %exitcond.3, label %.preheader.us46.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us46.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us46.preheader

.preheader.us46.preheader:                        ; preds = %.preheader.us46.preheader.loopexit, %middle.block118, %.prol.loopexit
  %min.iters.check = icmp ult i64 %72, 2
  %n.vec = and i64 %72, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %72, %n.vec
  br label %.preheader.us46

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph ], [ %indvars.iv56.ph, %scalar.ph.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv61
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %34, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv61
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  %27 = load double, double* %35, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv56
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv66
  br i1 %exitcond, label %._crit_edge.us49.loopexit, label %scalar.ph, !llvm.loop !5

.preheader.us46:                                  ; preds = %.preheader.us46.preheader, %._crit_edge.us49
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us49 ], [ 0, %.preheader.us46.preheader ]
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv61
  %33 = add nuw nsw i64 %indvars.iv61, 1
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %33
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv61
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %33
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv61
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv61
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us46
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us46 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us46
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %35
  %bound1 = icmp ult double* %35, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0102 = icmp ult double* %scevgep, %scevgep95
  %bound1103 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx = or i1 %found.conflict, %found.conflict104
  %bound0105 = icmp ult double* %scevgep, %scevgep99
  %bound1106 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx108 = or i1 %conflict.rdx, %found.conflict107
  %bound0111 = icmp ult double* %scevgep, %34
  %bound1112 = icmp ult double* %34, %scevgep91
  %found.conflict113 = and i1 %bound0111, %bound1112
  %conflict.rdx114 = or i1 %conflict.rdx108, %found.conflict113
  br i1 %conflict.rdx114, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %36 = or i64 %index, 1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv61
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %36, i64 %indvars.iv61
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = load double, double* %38, align 8, !alias.scope !6
  %41 = insertelement <2 x double> undef, double %39, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %42, %broadcast.splat116
  %44 = load double, double* %34, align 8, !alias.scope !9
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %43, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv61
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %36, i64 %indvars.iv61
  %50 = load double, double* %48, align 8, !alias.scope !11
  %51 = load double, double* %49, align 8, !alias.scope !11
  %52 = insertelement <2 x double> undef, double %50, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %53, %broadcast.splat116
  %55 = load double, double* %35, align 8, !alias.scope !13
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %54, %57
  %59 = fadd <2 x double> %47, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !15, !noalias !17
  %62 = fadd <2 x double> %wide.load, %59
  %63 = bitcast double* %60 to <2 x double>*
  store <2 x double> %62, <2 x double>* %63, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us49, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.preheader35.lr.ph, %._crit_edge40.us
  %indvars.iv139 = phi i2 [ 1, %.preheader35.lr.ph ], [ %indvars.iv.next140, %._crit_edge40.us ]
  %indvars.iv68 = phi i64 [ 0, %.preheader35.lr.ph ], [ %indvars.iv.next69, %._crit_edge40.us ]
  %indvars.iv66 = phi i64 [ 1, %.preheader35.lr.ph ], [ %indvars.iv.next67, %._crit_edge40.us ]
  %65 = zext i2 %indvars.iv139 to i64
  %66 = add nuw nsw i64 %65, 4294967295
  %67 = and i64 %66, 4294967295
  %68 = add nuw nsw i64 %67, 1
  %69 = add nsw i64 %indvars.iv68, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 0
  %70 = mul nuw nsw i64 %indvars.iv68, 1201
  %71 = add nuw nsw i64 %70, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %71
  %72 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %73 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter = and i32 %73, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  store double %76, double* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %68, %.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %indvars.iv68, 3
  br i1 %77, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %78 = sub i64 %69, %indvars.iv.unr
  %79 = lshr i64 %78, 2
  %80 = add nuw nsw i64 %79, 1
  %min.iters.check120 = icmp ult i64 %80, 2
  br i1 %min.iters.check120, label %.lr.ph.us.new.preheader138, label %min.iters.checked121

.lr.ph.us.new.preheader138:                       ; preds = %middle.block118, %min.iters.checked121, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked121 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end, %middle.block118 ]
  br label %.lr.ph.us.new

min.iters.checked121:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf122 = and i64 %80, 1
  %n.vec123 = sub nsw i64 %80, %n.mod.vf122
  %cmp.zero124 = icmp eq i64 %n.vec123, 0
  %81 = add nsw i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf122, 2
  %ind.end = sub i64 %83, %84
  br i1 %cmp.zero124, label %.lr.ph.us.new.preheader138, label %vector.ph125

vector.ph125:                                     ; preds = %min.iters.checked121
  br label %vector.body117

vector.body117:                                   ; preds = %vector.body117, %vector.ph125
  %index126 = phi i64 [ 0, %vector.ph125 ], [ %index.next127, %vector.body117 ]
  %85 = shl i64 %index126, 2
  %86 = add i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec133 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec134 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec135 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec, %broadcast.splat137
  %90 = fmul <2 x double> %strided.vec133, %broadcast.splat137
  %91 = fmul <2 x double> %strided.vec134, %broadcast.splat137
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %92
  %94 = fmul <2 x double> %strided.vec135, %broadcast.splat137
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %96, align 8
  %index.next127 = add i64 %index126, 2
  %99 = icmp eq i64 %index.next127, %n.vec123
  br i1 %99, label %middle.block118, label %vector.body117, !llvm.loop !21

middle.block118:                                  ; preds = %vector.body117
  %cmp.n129 = icmp eq i64 %n.mod.vf122, 0
  br i1 %cmp.n129, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader138

._crit_edge.us49.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us49

._crit_edge.us49:                                 ; preds = %._crit_edge.us49.loopexit, %middle.block
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 1000
  br i1 %exitcond64, label %._crit_edge40.us, label %.preheader.us46

._crit_edge40.us:                                 ; preds = %._crit_edge.us49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 1200
  %indvars.iv.next140 = add i2 %indvars.iv139, 1
  br i1 %exitcond71, label %._crit_edge44, label %.lr.ph.us

._crit_edge44:                                    ; preds = %._crit_edge40.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv15, 1200
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
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
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
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
