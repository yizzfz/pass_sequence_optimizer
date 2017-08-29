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
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
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
  %6 = zext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %7 = and i32 %0, 1
  %n.mod.vf = zext i32 %7 to i64
  %n.vec = sub nsw i64 %6, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep3 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep3, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind5 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next6, %vector.body ]
  %8 = sitofp <2 x i32> %vec.ind5 to <2 x double>
  %9 = fadd <2 x double> %8, <double 2.000000e+00, double 2.000000e+00>
  %10 = fdiv <2 x double> %9, %broadcast.splat
  %11 = getelementptr inbounds double, double* %1, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> %10, <2 x double>* %12, align 8, !alias.scope !1, !noalias !4
  %13 = fadd <2 x double> %8, <double 3.000000e+00, double 3.000000e+00>
  %14 = fdiv <2 x double> %13, %broadcast.splat
  %15 = getelementptr inbounds double, double* %2, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> %14, <2 x double>* %16, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next6 = add <2 x i32> %vec.ind5, <i32 2, i32 2>
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %7, 0
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %18 = insertelement <2 x double> undef, double %5, i32 0
  %19 = insertelement <2 x double> %18, double %5, i32 1
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %23 = insertelement <2 x double> undef, double %21, i32 0
  %24 = insertelement <2 x double> %23, double %21, i32 1
  %25 = fadd <2 x double> %24, <double 2.000000e+00, double 3.000000e+00>
  %26 = fdiv <2 x double> %25, %19
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %22, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %28, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, %6
  br i1 %exitcond1, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %8 = and i32 %6, 1
  %wide.trip.count16.1 = zext i32 %6 to i64
  %9 = add nsw i64 %wide.trip.count16.1, -2
  %scevgep25 = getelementptr double, double* %2, i64 2
  %10 = add nsw i64 %wide.trip.count16.1, -2
  %scevgep28 = getelementptr double, double* %3, i64 -1
  %scevgep31 = getelementptr double, double* %3, i64 3
  %11 = add nsw i64 %wide.trip.count16.1, -2
  %scevgep52 = getelementptr double, double* %3, i64 2
  %12 = add nsw i64 %wide.trip.count16.1, -2
  %scevgep55 = getelementptr double, double* %2, i64 -1
  %scevgep58 = getelementptr double, double* %2, i64 3
  %13 = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %1, 3
  %15 = icmp eq i32 %8, 0
  %sunkaddr94 = ptrtoint double* %3 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 8
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  %sunkaddr97 = ptrtoint double* %3 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 16
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to double*
  %sunkaddr100 = ptrtoint double* %2 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 8
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to double*
  %16 = icmp eq i32 %6, 2
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr86 = add i64 %sunkaddr, 8
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  %sunkaddr88 = ptrtoint double* %2 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 16
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  %sunkaddr91 = ptrtoint double* %3 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 8
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge5.us
  %17 = phi i32 [ %129, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %13, label %.prol.loopexit, label %18

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load double, double* %2, align 8
  %20 = load double, double* %sunkaddr87, align 8
  %21 = fadd double %19, %20
  %22 = load double, double* %sunkaddr90, align 8
  %23 = fadd double %21, %22
  %24 = fmul double %23, 3.333300e-01
  store double %24, double* %sunkaddr93, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge.us, %18
  %indvars.iv.unr.ph = phi i64 [ 2, %18 ], [ 1, %._crit_edge.us ]
  br i1 %14, label %.lr.ph4.us.preheader, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit
  %25 = sub nsw i64 %11, %indvars.iv.unr.ph
  %26 = lshr i64 %25, 1
  %27 = add nuw i64 %26, 1
  %min.iters.check44 = icmp ult i64 %27, 2
  br i1 %min.iters.check44, label %._crit_edge.us.new.preheader104, label %min.iters.checked45

min.iters.checked45:                              ; preds = %._crit_edge.us.new.preheader
  %n.mod.vf46 = and i64 %27, 1
  %n.vec47 = sub i64 %27, %n.mod.vf46
  %cmp.zero48 = icmp eq i64 %n.vec47, 0
  br i1 %cmp.zero48, label %._crit_edge.us.new.preheader104, label %vector.memcheck65

vector.memcheck65:                                ; preds = %min.iters.checked45
  %scevgep50 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %28 = sub nsw i64 %12, %indvars.iv.unr.ph
  %29 = and i64 %28, -2
  %30 = add nsw i64 %indvars.iv.unr.ph, %29
  %scevgep53 = getelementptr double, double* %scevgep52, i64 %30
  %scevgep56 = getelementptr double, double* %scevgep55, i64 %indvars.iv.unr.ph
  %scevgep59 = getelementptr double, double* %scevgep58, i64 %30
  %bound061 = icmp ult double* %scevgep50, %scevgep59
  %bound162 = icmp ult double* %scevgep56, %scevgep53
  %memcheck.conflict64 = and i1 %bound061, %bound162
  %31 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %32 = shl nuw i64 %26, 1
  %33 = add i64 %31, %32
  %34 = shl nuw nsw i64 %n.mod.vf46, 1
  %ind.end70 = sub i64 %33, %34
  br i1 %memcheck.conflict64, label %._crit_edge.us.new.preheader104, label %vector.body41.preheader

vector.body41.preheader:                          ; preds = %vector.memcheck65
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41.preheader, %vector.body41
  %index67 = phi i64 [ %index.next68, %vector.body41 ], [ 0, %vector.body41.preheader ]
  %35 = shl i64 %index67, 1
  %offset.idx72 = or i64 %indvars.iv.unr.ph, %35
  %36 = add nsw i64 %offset.idx72, -1
  %37 = getelementptr inbounds double, double* %2, i64 %36
  %38 = bitcast double* %37 to <4 x double>*
  %wide.vec76 = load <4 x double>, <4 x double>* %38, align 8, !alias.scope !10
  %strided.vec77 = shufflevector <4 x double> %wide.vec76, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec78 = shufflevector <4 x double> %wide.vec76, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %39 = fadd <2 x double> %strided.vec77, %strided.vec78
  %40 = add nuw nsw i64 %offset.idx72, 1
  %41 = getelementptr inbounds double, double* %2, i64 %40
  %42 = getelementptr double, double* %41, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec79 = load <4 x double>, <4 x double>* %43, align 8, !alias.scope !10
  %strided.vec81 = shufflevector <4 x double> %wide.vec79, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = fadd <2 x double> %39, %strided.vec81
  %45 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %46 = bitcast double* %41 to <4 x double>*
  %wide.vec82 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !10
  %strided.vec84 = shufflevector <4 x double> %wide.vec82, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fadd <4 x double> %wide.vec79, %wide.vec82
  %48 = shufflevector <4 x double> %47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %49 = fadd <2 x double> %48, %strided.vec84
  %50 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %51 = getelementptr inbounds double, double* %3, i64 %40
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec85 = shufflevector <2 x double> %45, <2 x double> %50, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec85, <4 x double>* %53, align 8, !alias.scope !13, !noalias !10
  %index.next68 = add i64 %index67, 2
  %54 = icmp eq i64 %index.next68, %n.vec47
  br i1 %54, label %middle.block42, label %vector.body41, !llvm.loop !15

middle.block42:                                   ; preds = %vector.body41
  %cmp.n71 = icmp eq i64 %n.mod.vf46, 0
  br i1 %cmp.n71, label %.lr.ph4.us.preheader, label %._crit_edge.us.new.preheader104

._crit_edge.us.new.preheader104:                  ; preds = %middle.block42, %vector.memcheck65, %min.iters.checked45, %._crit_edge.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck65 ], [ %indvars.iv.unr.ph, %min.iters.checked45 ], [ %indvars.iv.unr.ph, %._crit_edge.us.new.preheader ], [ %ind.end70, %middle.block42 ]
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader104, %._crit_edge.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge.us.new ], [ %indvars.iv.ph, %._crit_edge.us.new.preheader104 ]
  %55 = add nsw i64 %indvars.iv, -1
  %56 = getelementptr inbounds double, double* %2, i64 %55
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 3.333300e-01
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %64, double* %65, align 8
  %66 = load double, double* %58, align 8
  %67 = load double, double* %61, align 8
  %68 = fadd double %66, %67
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %69 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %72 = fmul double %71, 3.333300e-01
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %72, double* %73, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count16.1
  br i1 %exitcond.1, label %.lr.ph4.us.preheader.loopexit, label %._crit_edge.us.new, !llvm.loop !16

.lr.ph4.us.preheader.loopexit:                    ; preds = %._crit_edge.us.new
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block42, %.prol.loopexit
  br i1 %15, label %.lr.ph4.us.prol, label %.lr.ph4.us.prol.loopexit

.lr.ph4.us.prol:                                  ; preds = %.lr.ph4.us.preheader
  %74 = load double, double* %3, align 8
  %75 = load double, double* %sunkaddr96, align 8
  %76 = fadd double %74, %75
  %77 = load double, double* %sunkaddr99, align 8
  %78 = fadd double %76, %77
  %79 = fmul double %78, 3.333300e-01
  store double %79, double* %sunkaddr102, align 8
  br label %.lr.ph4.us.prol.loopexit

.lr.ph4.us.prol.loopexit:                         ; preds = %.lr.ph4.us.prol, %.lr.ph4.us.preheader
  %indvars.iv14.unr.ph = phi i64 [ 2, %.lr.ph4.us.prol ], [ 1, %.lr.ph4.us.preheader ]
  br i1 %16, label %._crit_edge5.us, label %.lr.ph4.us.preheader23

.lr.ph4.us.preheader23:                           ; preds = %.lr.ph4.us.prol.loopexit
  %80 = sub nsw i64 %9, %indvars.iv14.unr.ph
  %81 = lshr i64 %80, 1
  %82 = add nuw i64 %81, 1
  %min.iters.check = icmp ult i64 %82, 2
  br i1 %min.iters.check, label %.lr.ph4.us.preheader103, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader23
  %n.mod.vf = and i64 %82, 1
  %n.vec = sub i64 %82, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph4.us.preheader103, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv14.unr.ph
  %83 = sub nsw i64 %10, %indvars.iv14.unr.ph
  %84 = and i64 %83, -2
  %85 = add nsw i64 %indvars.iv14.unr.ph, %84
  %scevgep26 = getelementptr double, double* %scevgep25, i64 %85
  %scevgep29 = getelementptr double, double* %scevgep28, i64 %indvars.iv14.unr.ph
  %scevgep32 = getelementptr double, double* %scevgep31, i64 %85
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep29, %scevgep26
  %memcheck.conflict = and i1 %bound0, %bound1
  %86 = add nuw nsw i64 %indvars.iv14.unr.ph, 2
  %87 = shl nuw i64 %81, 1
  %88 = add i64 %86, %87
  %89 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %88, %89
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader103, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %90 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv14.unr.ph, %90
  %91 = add nsw i64 %offset.idx, -1
  %92 = getelementptr inbounds double, double* %3, i64 %91
  %93 = bitcast double* %92 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %93, align 8, !alias.scope !17
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec34 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %94 = fadd <2 x double> %strided.vec, %strided.vec34
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = getelementptr inbounds double, double* %3, i64 %95
  %97 = getelementptr double, double* %96, i64 -1
  %98 = bitcast double* %97 to <4 x double>*
  %wide.vec35 = load <4 x double>, <4 x double>* %98, align 8, !alias.scope !17
  %strided.vec37 = shufflevector <4 x double> %wide.vec35, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %99 = fadd <2 x double> %94, %strided.vec37
  %100 = fmul <2 x double> %99, <double 3.333300e-01, double 3.333300e-01>
  %101 = bitcast double* %96 to <4 x double>*
  %wide.vec38 = load <4 x double>, <4 x double>* %101, align 8, !alias.scope !17
  %strided.vec40 = shufflevector <4 x double> %wide.vec38, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %102 = fadd <4 x double> %wide.vec35, %wide.vec38
  %103 = shufflevector <4 x double> %102, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %104 = fadd <2 x double> %103, %strided.vec40
  %105 = fmul <2 x double> %104, <double 3.333300e-01, double 3.333300e-01>
  %106 = getelementptr inbounds double, double* %2, i64 %95
  %107 = getelementptr double, double* %106, i64 -1
  %108 = bitcast double* %107 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %100, <2 x double> %105, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %108, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 2
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge5.us, label %.lr.ph4.us.preheader103

.lr.ph4.us.preheader103:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader23
  %indvars.iv14.ph = phi i64 [ %indvars.iv14.unr.ph, %vector.memcheck ], [ %indvars.iv14.unr.ph, %min.iters.checked ], [ %indvars.iv14.unr.ph, %.lr.ph4.us.preheader23 ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader103, %.lr.ph4.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %.lr.ph4.us ], [ %indvars.iv14.ph, %.lr.ph4.us.preheader103 ]
  %110 = add nsw i64 %indvars.iv14, -1
  %111 = getelementptr inbounds double, double* %3, i64 %110
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %116 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = fmul double %118, 3.333300e-01
  %120 = getelementptr inbounds double, double* %2, i64 %indvars.iv14
  store double %119, double* %120, align 8
  %121 = load double, double* %113, align 8
  %122 = load double, double* %116, align 8
  %123 = fadd double %121, %122
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %124 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.1
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  %127 = fmul double %126, 3.333300e-01
  %128 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next15
  store double %127, double* %128, align 8
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, %wide.trip.count16.1
  br i1 %exitcond17.1, label %._crit_edge5.us.loopexit, label %.lr.ph4.us, !llvm.loop !23

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block, %.lr.ph4.us.prol.loopexit
  %129 = add nuw nsw i32 %17, 1
  %exitcond18 = icmp eq i32 %129, %0
  br i1 %exitcond18, label %.loopexit.loopexit, label %._crit_edge.us

.loopexit.loopexit:                               ; preds = %._crit_edge5.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %4
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
  br i1 %7, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %2
  %8 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond3, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
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
