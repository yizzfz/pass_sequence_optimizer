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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader35.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %._crit_edge42.us, %.preheader35.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader35.us.preheader ], [ %indvars.iv.next53, %._crit_edge42.us ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader35.us
  %indvars.iv49 = phi i64 [ 0, %.preheader35.us ], [ %indvars.iv.next50, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv49, %indvars.iv52
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv52, i64 %indvars.iv49
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
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv49
  store double %22, double* %23, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 1000
  br i1 %exitcond51, label %._crit_edge42.us, label %7

._crit_edge42.us:                                 ; preds = %7
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond54, label %.preheader.us.preheader, label %.preheader35.us

.preheader.us.preheader:                          ; preds = %._crit_edge42.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv46
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond48, label %._crit_edge39, label %.preheader.us

._crit_edge39:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.preheader35.us.preheader:
  %broadcast.splatinsert111 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat112 = shufflevector <2 x double> %broadcast.splatinsert111, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert132 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat133 = shufflevector <2 x double> %broadcast.splatinsert132, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader134, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader134 ]
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

.preheader.us46.preheader:                        ; preds = %.preheader.us46.preheader.loopexit, %middle.block114, %.prol.loopexit
  %n.vec = and i64 %72, -2
  br label %.preheader.us46

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph ], [ %indvars.iv56.ph, %scalar.ph.preheader ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv62
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %35, align 8
  %23 = fmul double %21, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv62
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  %27 = load double, double* %36, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %23, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv56
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next57, %indvars.iv66
  br i1 %exitcond61, label %._crit_edge.us49.loopexit, label %scalar.ph, !llvm.loop !5

.preheader.us46:                                  ; preds = %.preheader.us46.preheader, %._crit_edge.us49
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge.us49 ], [ 0, %.preheader.us46.preheader ]
  %33 = icmp ult i64 %72, 2
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv62
  %34 = add nuw nsw i64 %indvars.iv62, 1
  %scevgep91 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %34
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv62
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %34
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv62
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv62
  br i1 %33, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us46
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us46 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us46
  %37 = icmp eq i64 %n.vec, 0
  br i1 %37, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %36
  %bound1 = icmp ult double* %36, %scevgep87
  %found.conflict = and i1 %bound0, %bound1
  %bound098 = icmp ult double* %scevgep, %scevgep91
  %bound199 = icmp ult double* %scevgep89, %scevgep87
  %found.conflict100 = and i1 %bound098, %bound199
  %conflict.rdx = or i1 %found.conflict, %found.conflict100
  %bound0101 = icmp ult double* %scevgep, %scevgep95
  %bound1102 = icmp ult double* %scevgep93, %scevgep87
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx104 = or i1 %conflict.rdx, %found.conflict103
  %bound0107 = icmp ult double* %scevgep, %35
  %bound1108 = icmp ult double* %35, %scevgep87
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %conflict.rdx104, %found.conflict109
  br i1 %conflict.rdx110, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %38 = load double, double* %35, align 8, !alias.scope !6
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = load double, double* %36, align 8, !alias.scope !9
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %44 = or i64 %index, 1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv62
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %44, i64 %indvars.iv62
  %47 = load double, double* %45, align 8, !alias.scope !11
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = insertelement <2 x double> undef, double %47, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %50, %broadcast.splat112
  %52 = fmul <2 x double> %51, %40
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv62
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %44, i64 %indvars.iv62
  %55 = load double, double* %53, align 8, !alias.scope !13
  %56 = load double, double* %54, align 8, !alias.scope !13
  %57 = insertelement <2 x double> undef, double %55, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  %59 = fmul <2 x double> %58, %broadcast.splat112
  %60 = fmul <2 x double> %59, %43
  %61 = fadd <2 x double> %52, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %index
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !15, !noalias !17
  %64 = fadd <2 x double> %wide.load, %61
  %65 = bitcast double* %62 to <2 x double>*
  store <2 x double> %64, <2 x double>* %65, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %66 = icmp eq i64 %index.next, %n.vec
  br i1 %66, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  %67 = icmp eq i64 %72, %n.vec
  br i1 %67, label %._crit_edge.us49, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.preheader35.us.preheader, %._crit_edge40.us
  %indvars.iv135 = phi i2 [ 1, %.preheader35.us.preheader ], [ %indvars.iv.next136, %._crit_edge40.us ]
  %indvars.iv68 = phi i64 [ 0, %.preheader35.us.preheader ], [ %73, %._crit_edge40.us ]
  %indvars.iv66 = phi i64 [ 1, %.preheader35.us.preheader ], [ %indvars.iv.next67, %._crit_edge40.us ]
  %68 = zext i2 %indvars.iv135 to i64
  %69 = add nsw i64 %indvars.iv68, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 0
  %70 = mul nuw nsw i64 %indvars.iv68, 1201
  %71 = add nuw nsw i64 %70, 1
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %71
  %72 = add nuw nsw i64 %indvars.iv68, 1
  %73 = add nuw nsw i64 %indvars.iv68, 1
  %xtraiter = and i64 %73, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  store double %76, double* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
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
  %min.iters.check116 = icmp ult i64 %80, 2
  br i1 %min.iters.check116, label %.lr.ph.us.new.preheader134, label %min.iters.checked117

.lr.ph.us.new.preheader134:                       ; preds = %middle.block114, %min.iters.checked117, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked117 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end, %middle.block114 ]
  br label %.lr.ph.us.new

min.iters.checked117:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf118 = and i64 %80, 1
  %n.vec119 = sub nsw i64 %80, %n.mod.vf118
  %cmp.zero120 = icmp eq i64 %n.vec119, 0
  %81 = or i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf118, 2
  %ind.end = sub i64 %83, %84
  br i1 %cmp.zero120, label %.lr.ph.us.new.preheader134, label %vector.ph121

vector.ph121:                                     ; preds = %min.iters.checked117
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113, %vector.ph121
  %index122 = phi i64 [ 0, %vector.ph121 ], [ %index.next123, %vector.body113 ]
  %85 = shl i64 %index122, 2
  %86 = or i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec129 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec130 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec131 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec, %broadcast.splat133
  %90 = fmul <2 x double> %strided.vec129, %broadcast.splat133
  %91 = fmul <2 x double> %strided.vec130, %broadcast.splat133
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %92
  %94 = fmul <2 x double> %strided.vec131, %broadcast.splat133
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %96, align 8
  %index.next123 = add i64 %index122, 2
  %99 = icmp eq i64 %index.next123, %n.vec119
  br i1 %99, label %middle.block114, label %vector.body113, !llvm.loop !21

middle.block114:                                  ; preds = %vector.body113
  %cmp.n125 = icmp eq i64 %n.mod.vf118, 0
  br i1 %cmp.n125, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader134

._crit_edge.us49.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us49

._crit_edge.us49:                                 ; preds = %._crit_edge.us49.loopexit, %middle.block
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 1000
  br i1 %exitcond64, label %._crit_edge40.us, label %.preheader.us46

._crit_edge40.us:                                 ; preds = %._crit_edge.us49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70 = icmp eq i64 %73, 1200
  %indvars.iv.next136 = add i2 %indvars.iv135, 1
  br i1 %exitcond70, label %._crit_edge44, label %.lr.ph.us

._crit_edge44:                                    ; preds = %._crit_edge40.us
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
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1200
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
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
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
