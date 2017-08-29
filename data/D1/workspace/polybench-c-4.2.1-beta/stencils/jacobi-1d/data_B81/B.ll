; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %.cast1 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep2 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep2, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind4 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next5, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %17 = insertelement <2 x double> undef, double %5, i32 0
  %18 = insertelement <2 x double> %17, double %5, i32 1
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = insertelement <2 x double> %22, double %20, i32 1
  %24 = fadd <2 x double> %23, <double 2.000000e+00, double 3.000000e+00>
  %25 = fdiv <2 x double> %24, %18
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %21, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, %6
  br i1 %29, label %scalar.ph, label %.loopexit.loopexit, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.split

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %6 to i64
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax36 = select i1 %12, i64 %9, i64 2
  %scevgep37 = getelementptr double, double* %2, i64 %smax36
  %13 = add nuw nsw i64 %smax36, 1
  %scevgep39 = getelementptr double, double* %3, i64 %13
  %14 = add nsw i64 %wide.trip.count.1, -2
  %scevgep58 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %wide.trip.count.1, -2
  %scevgep61 = getelementptr double, double* %2, i64 -1
  %scevgep64 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i32 %xtraiter, 0
  %17 = icmp eq i32 %1, 3
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ugt double* %scevgep37, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr89 = add i64 %sunkaddr, 8
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  %sunkaddr91 = ptrtoint double* %2 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 16
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  %sunkaddr94 = ptrtoint double* %3 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 8
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge5.us
  %18 = phi i32 [ %115, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %16, label %.prol.loopexit, label %19

; <label>:19:                                     ; preds = %._crit_edge.us
  %20 = load double, double* %2, align 8
  %21 = load double, double* %sunkaddr90, align 8
  %22 = fadd double %20, %21
  %23 = load double, double* %sunkaddr93, align 8
  %24 = fadd double %22, %23
  %25 = fmul double %24, 3.333300e-01
  store double %25, double* %sunkaddr96, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge.us, %19
  %indvars.iv.unr.ph = phi i64 [ 2, %19 ], [ 1, %._crit_edge.us ]
  br i1 %17, label %.lr.ph4.us.preheader, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit
  %26 = sub nsw i64 %14, %indvars.iv.unr.ph
  %27 = lshr i64 %26, 1
  %28 = add nuw i64 %27, 1
  %min.iters.check50 = icmp ult i64 %28, 2
  br i1 %min.iters.check50, label %._crit_edge.us.new.preheader98, label %min.iters.checked51

min.iters.checked51:                              ; preds = %._crit_edge.us.new.preheader
  %n.mod.vf52 = and i64 %28, 1
  %n.vec53 = sub i64 %28, %n.mod.vf52
  %cmp.zero54 = icmp eq i64 %n.vec53, 0
  br i1 %cmp.zero54, label %._crit_edge.us.new.preheader98, label %vector.memcheck71

vector.memcheck71:                                ; preds = %min.iters.checked51
  %scevgep56 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %29 = sub nsw i64 %15, %indvars.iv.unr.ph
  %30 = and i64 %29, -2
  %31 = add nsw i64 %indvars.iv.unr.ph, %30
  %scevgep59 = getelementptr double, double* %scevgep58, i64 %31
  %scevgep62 = getelementptr double, double* %scevgep61, i64 %indvars.iv.unr.ph
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %31
  %bound067 = icmp ult double* %scevgep56, %scevgep65
  %bound168 = icmp ult double* %scevgep62, %scevgep59
  %memcheck.conflict70 = and i1 %bound067, %bound168
  %32 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %33 = shl nuw i64 %27, 1
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf52, 1
  %ind.end76 = sub i64 %34, %35
  br i1 %memcheck.conflict70, label %._crit_edge.us.new.preheader98, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %vector.memcheck71
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index73 = phi i64 [ %index.next74, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %36 = shl i64 %index73, 1
  %offset.idx78 = or i64 %indvars.iv.unr.ph, %36
  %37 = add nsw i64 %offset.idx78, -1
  %38 = getelementptr inbounds double, double* %2, i64 %37
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !10
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec82 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = fadd <2 x double> %strided.vec, %strided.vec82
  %41 = add nuw nsw i64 %offset.idx78, 1
  %42 = getelementptr inbounds double, double* %2, i64 %41
  %43 = getelementptr double, double* %42, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !10
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fadd <2 x double> %40, %strided.vec85
  %46 = fmul <2 x double> %45, <double 3.333300e-01, double 3.333300e-01>
  %47 = bitcast double* %42 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %47, align 8, !alias.scope !10
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = fadd <4 x double> %wide.vec83, %wide.vec86
  %49 = shufflevector <4 x double> %48, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %50 = fadd <2 x double> %49, %strided.vec88
  %51 = fmul <2 x double> %50, <double 3.333300e-01, double 3.333300e-01>
  %52 = getelementptr inbounds double, double* %3, i64 %41
  %53 = getelementptr double, double* %52, i64 -1
  %54 = bitcast double* %53 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %46, <2 x double> %51, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %54, align 8, !alias.scope !13, !noalias !10
  %index.next74 = add i64 %index73, 2
  %55 = icmp eq i64 %index.next74, %n.vec53
  br i1 %55, label %middle.block48, label %vector.body47, !llvm.loop !15

middle.block48:                                   ; preds = %vector.body47
  %cmp.n77 = icmp eq i64 %n.mod.vf52, 0
  br i1 %cmp.n77, label %.lr.ph4.us.preheader, label %._crit_edge.us.new.preheader98

._crit_edge.us.new.preheader98:                   ; preds = %middle.block48, %vector.memcheck71, %min.iters.checked51, %._crit_edge.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck71 ], [ %indvars.iv.unr.ph, %min.iters.checked51 ], [ %indvars.iv.unr.ph, %._crit_edge.us.new.preheader ], [ %ind.end76, %middle.block48 ]
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader98, %._crit_edge.us.new
  %indvars.iv = phi i64 [ %71, %._crit_edge.us.new ], [ %indvars.iv.ph, %._crit_edge.us.new.preheader98 ]
  %56 = add nsw i64 %indvars.iv, -1
  %57 = getelementptr inbounds double, double* %2, i64 %56
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds double, double* %2, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fadd double %61, %64
  %66 = fmul double %65, 3.333300e-01
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %66, double* %67, align 8
  %68 = load double, double* %59, align 8
  %69 = load double, double* %63, align 8
  %70 = fadd double %68, %69
  %71 = add nsw i64 %indvars.iv, 2
  %72 = getelementptr inbounds double, double* %2, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fadd double %70, %73
  %75 = fmul double %74, 3.333300e-01
  %76 = getelementptr inbounds double, double* %3, i64 %62
  store double %75, double* %76, align 8
  %exitcond.1 = icmp eq i64 %71, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph4.us.preheader.loopexit, label %._crit_edge.us.new, !llvm.loop !16

.lr.ph4.us.preheader.loopexit:                    ; preds = %._crit_edge.us.new
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %.prol.loopexit, %middle.block48
  br i1 %min.iters.check, label %.lr.ph4.us.preheader97, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  br i1 %cmp.zero, label %.lr.ph4.us.preheader97, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader97, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = add nsw i64 %offset.idx, -1
  %78 = getelementptr inbounds double, double* %3, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !17
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !17
  %82 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !17
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !17
  %86 = fadd <2 x double> %wide.load, %wide.load43
  %87 = fadd <2 x double> %wide.load42, %wide.load44
  %88 = add nuw nsw i64 %offset.idx, 1
  %89 = getelementptr inbounds double, double* %3, i64 %88
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !17
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !17
  %93 = fadd <2 x double> %86, %wide.load45
  %94 = fadd <2 x double> %87, %wide.load46
  %95 = fmul <2 x double> %93, <double 3.333300e-01, double 3.333300e-01>
  %96 = fmul <2 x double> %94, <double 3.333300e-01, double 3.333300e-01>
  %97 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %95, <2 x double>* %98, align 8, !alias.scope !20, !noalias !17
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %96, <2 x double>* %100, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge5.us, label %.lr.ph4.us.preheader97

.lr.ph4.us.preheader97:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader97, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %108, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader97 ]
  %102 = add nsw i64 %indvars.iv25, -1
  %103 = getelementptr inbounds double, double* %3, i64 %102
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  %108 = add nuw nsw i64 %indvars.iv25, 1
  %109 = getelementptr inbounds double, double* %3, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fadd double %107, %110
  %112 = fmul double %111, 3.333300e-01
  %113 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %112, double* %113, align 8
  %114 = icmp slt i64 %108, %9
  br i1 %114, label %.lr.ph4.us, label %._crit_edge5.us.loopexit, !llvm.loop !23

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %115 = add nsw i32 %18, 1
  %116 = icmp slt i32 %115, %0
  br i1 %116, label %._crit_edge.us, label %._crit_edge.lr.ph.split.loopexit

._crit_edge.lr.ph.split.loopexit:                 ; preds = %._crit_edge5.us
  br label %._crit_edge.lr.ph.split

._crit_edge.lr.ph.split:                          ; preds = %._crit_edge.lr.ph.split.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, %8
  br i1 %19, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
