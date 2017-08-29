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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %6 = and i32 %0, 1
  %n.mod.vf = zext i32 %6 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %wide.trip.count
  %scevgep2 = getelementptr double, double* %2, i64 %wide.trip.count
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
  %cmp.n = icmp eq i32 %6, 0
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, %5
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader3.lr.ph, label %._crit_edge5

.preheader3.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %.preheader3.us.preheader, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.lr.ph
  %8 = add i32 %0, -1
  %xtraiter110 = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter110, 0
  br i1 %lcmp.mod, label %.preheader3.prol.loopexit, label %.preheader3.prol.preheader

.preheader3.prol.preheader:                       ; preds = %.preheader3.preheader
  br label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.preheader3.prol, %.preheader3.prol.preheader
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader3.prol ], [ %xtraiter110, %.preheader3.prol.preheader ]
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader3.prol.loopexit.unr-lcssa, label %.preheader3.prol, !llvm.loop !10

.preheader3.prol.loopexit.unr-lcssa:              ; preds = %.preheader3.prol
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.preheader3.preheader, %.preheader3.prol.loopexit.unr-lcssa
  %.unr = phi i32 [ 0, %.preheader3.preheader ], [ %xtraiter110, %.preheader3.prol.loopexit.unr-lcssa ]
  %9 = icmp ult i32 %8, 7
  br i1 %9, label %._crit_edge5.loopexit109, label %.preheader3.preheader.new

.preheader3.preheader.new:                        ; preds = %.preheader3.prol.loopexit
  br label %.preheader3

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %10 = add i32 %1, -2
  %11 = add i32 %1, -3
  %xtraiter = and i32 %10, 1
  %xtraiter10 = and i32 %10, 1
  %wide.trip.count9.1 = zext i32 %6 to i64
  %wide.trip.count.1 = zext i32 %6 to i64
  %12 = add nsw i64 %wide.trip.count9.1, -2
  %scevgep46 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %wide.trip.count9.1, -2
  %scevgep49 = getelementptr double, double* %3, i64 -1
  %scevgep52 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %wide.trip.count9.1, -2
  %scevgep73 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %wide.trip.count9.1, -2
  %scevgep76 = getelementptr double, double* %2, i64 -1
  %scevgep79 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i32 %xtraiter, 0
  %17 = icmp eq i32 %11, 0
  %18 = icmp eq i32 %xtraiter10, 0
  %19 = icmp eq i32 %11, 0
  %sunkaddr34 = ptrtoint double* %3 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 8
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  %sunkaddr37 = ptrtoint double* %3 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 16
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to double*
  %sunkaddr40 = ptrtoint double* %2 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 8
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr26 = add i64 %sunkaddr, 8
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %sunkaddr28 = ptrtoint double* %2 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 16
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  %sunkaddr31 = ptrtoint double* %3 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 8
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge.us, %.preheader3.us.preheader
  %20 = phi i32 [ %57, %._crit_edge.us ], [ 0, %.preheader3.us.preheader ]
  br i1 %16, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader3.us
  %21 = load double, double* %2, align 8
  %22 = load double, double* %sunkaddr27, align 8
  %23 = fadd double %21, %22
  %24 = load double, double* %sunkaddr30, align 8
  %25 = fadd double %23, %24
  %26 = fmul double %25, 3.333300e-01
  store double %26, double* %sunkaddr33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader3.us
  %indvars.iv.unr.ph = phi i64 [ 2, %.prol.preheader ], [ 1, %.preheader3.us ]
  br i1 %17, label %.lr.ph4.us.preheader, label %.preheader3.us.new.preheader

.preheader3.us.new.preheader:                     ; preds = %.prol.loopexit
  %27 = sub nsw i64 %14, %indvars.iv.unr.ph
  %28 = lshr i64 %27, 1
  %29 = add nuw i64 %28, 1
  %min.iters.check65 = icmp ult i64 %29, 2
  br i1 %min.iters.check65, label %.preheader3.us.new.preheader108, label %min.iters.checked66

.preheader3.us.new.preheader108:                  ; preds = %middle.block63, %vector.memcheck86, %min.iters.checked66, %.preheader3.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck86 ], [ %indvars.iv.unr.ph, %min.iters.checked66 ], [ %indvars.iv.unr.ph, %.preheader3.us.new.preheader ], [ %ind.end91, %middle.block63 ]
  br label %.preheader3.us.new

min.iters.checked66:                              ; preds = %.preheader3.us.new.preheader
  %n.mod.vf67 = and i64 %29, 1
  %n.vec68 = sub i64 %29, %n.mod.vf67
  %cmp.zero69 = icmp eq i64 %n.vec68, 0
  br i1 %cmp.zero69, label %.preheader3.us.new.preheader108, label %vector.memcheck86

vector.memcheck86:                                ; preds = %min.iters.checked66
  %scevgep71 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %30 = sub nsw i64 %15, %indvars.iv.unr.ph
  %31 = and i64 %30, -2
  %32 = add nsw i64 %indvars.iv.unr.ph, %31
  %scevgep74 = getelementptr double, double* %scevgep73, i64 %32
  %scevgep77 = getelementptr double, double* %scevgep76, i64 %indvars.iv.unr.ph
  %scevgep80 = getelementptr double, double* %scevgep79, i64 %32
  %bound082 = icmp ult double* %scevgep71, %scevgep80
  %bound183 = icmp ult double* %scevgep77, %scevgep74
  %memcheck.conflict85 = and i1 %bound082, %bound183
  %33 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %34 = shl nuw i64 %28, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf67, 1
  %ind.end91 = sub i64 %35, %36
  br i1 %memcheck.conflict85, label %.preheader3.us.new.preheader108, label %vector.body62.preheader

vector.body62.preheader:                          ; preds = %vector.memcheck86
  br label %vector.body62

vector.body62:                                    ; preds = %vector.body62.preheader, %vector.body62
  %index88 = phi i64 [ %index.next89, %vector.body62 ], [ 0, %vector.body62.preheader ]
  %37 = shl i64 %index88, 1
  %offset.idx93 = or i64 %indvars.iv.unr.ph, %37
  %38 = add nsw i64 %offset.idx93, -1
  %39 = getelementptr inbounds double, double* %2, i64 %38
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec97 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !12
  %strided.vec98 = shufflevector <4 x double> %wide.vec97, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec99 = shufflevector <4 x double> %wide.vec97, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec98, %strided.vec99
  %42 = add nuw nsw i64 %offset.idx93, 1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec100 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !12
  %strided.vec102 = shufflevector <4 x double> %wide.vec100, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec102
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = bitcast double* %43 to <4 x double>*
  %wide.vec103 = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !12
  %strided.vec105 = shufflevector <4 x double> %wide.vec103, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fadd <4 x double> %wide.vec100, %wide.vec103
  %50 = shufflevector <4 x double> %49, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %51 = fadd <2 x double> %50, %strided.vec105
  %52 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %3, i64 %42
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %interleaved.vec106 = shufflevector <2 x double> %47, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec106, <4 x double>* %55, align 8, !alias.scope !15, !noalias !12
  %index.next89 = add i64 %index88, 2
  %56 = icmp eq i64 %index.next89, %n.vec68
  br i1 %56, label %middle.block63, label %vector.body62, !llvm.loop !17

middle.block63:                                   ; preds = %vector.body62
  %cmp.n92 = icmp eq i64 %n.mod.vf67, 0
  br i1 %cmp.n92, label %.lr.ph4.us.preheader, label %.preheader3.us.new.preheader108

._crit_edge.us.loopexit:                          ; preds = %.lr.ph4.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph4.us.prol.loopexit
  %57 = add nuw nsw i32 %20, 1
  %exitcond = icmp eq i32 %57, %0
  br i1 %exitcond, label %._crit_edge5.loopexit, label %.preheader3.us

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader107, %.lr.ph4.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8.1, %.lr.ph4.us ], [ %indvars.iv7.ph, %.lr.ph4.us.preheader107 ]
  %58 = add nsw i64 %indvars.iv7, -1
  %59 = getelementptr inbounds double, double* %3, i64 %58
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv7
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %64 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 3.333300e-01
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv7
  store double %67, double* %68, align 8
  %69 = getelementptr inbounds double, double* %3, i64 %indvars.iv7
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %74 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.1
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = fmul double %76, 3.333300e-01
  %78 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next8
  store double %77, double* %78, align 8
  %exitcond.113 = icmp eq i64 %indvars.iv.next8.1, %wide.trip.count9.1
  br i1 %exitcond.113, label %._crit_edge.us.loopexit, label %.lr.ph4.us, !llvm.loop !18

.preheader3.us.new:                               ; preds = %.preheader3.us.new.preheader108, %.preheader3.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader3.us.new ], [ %indvars.iv.ph, %.preheader3.us.new.preheader108 ]
  %79 = add nsw i64 %indvars.iv, -1
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  %88 = fmul double %87, 3.333300e-01
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = fmul double %97, 3.333300e-01
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %98, double* %99, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph4.us.preheader.loopexit, label %.preheader3.us.new, !llvm.loop !19

.lr.ph4.us.preheader.loopexit:                    ; preds = %.preheader3.us.new
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block63, %.prol.loopexit
  br i1 %18, label %.lr.ph4.us.prol.loopexit, label %.lr.ph4.us.prol

.lr.ph4.us.prol:                                  ; preds = %.lr.ph4.us.preheader
  %100 = load double, double* %3, align 8
  %101 = load double, double* %sunkaddr36, align 8
  %102 = fadd double %100, %101
  %103 = load double, double* %sunkaddr39, align 8
  %104 = fadd double %102, %103
  %105 = fmul double %104, 3.333300e-01
  store double %105, double* %sunkaddr42, align 8
  br label %.lr.ph4.us.prol.loopexit

.lr.ph4.us.prol.loopexit:                         ; preds = %.lr.ph4.us.prol, %.lr.ph4.us.preheader
  %indvars.iv7.unr.ph = phi i64 [ 2, %.lr.ph4.us.prol ], [ 1, %.lr.ph4.us.preheader ]
  br i1 %19, label %._crit_edge.us, label %.lr.ph4.us.preheader24

.lr.ph4.us.preheader24:                           ; preds = %.lr.ph4.us.prol.loopexit
  %106 = sub nsw i64 %12, %indvars.iv7.unr.ph
  %107 = lshr i64 %106, 1
  %108 = add nuw i64 %107, 1
  %min.iters.check = icmp ult i64 %108, 2
  br i1 %min.iters.check, label %.lr.ph4.us.preheader107, label %min.iters.checked

.lr.ph4.us.preheader107:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader24
  %indvars.iv7.ph = phi i64 [ %indvars.iv7.unr.ph, %vector.memcheck ], [ %indvars.iv7.unr.ph, %min.iters.checked ], [ %indvars.iv7.unr.ph, %.lr.ph4.us.preheader24 ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader24
  %n.mod.vf = and i64 %108, 1
  %n.vec = sub i64 %108, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph4.us.preheader107, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv7.unr.ph
  %109 = sub nsw i64 %13, %indvars.iv7.unr.ph
  %110 = and i64 %109, -2
  %111 = add nsw i64 %indvars.iv7.unr.ph, %110
  %scevgep47 = getelementptr double, double* %scevgep46, i64 %111
  %scevgep50 = getelementptr double, double* %scevgep49, i64 %indvars.iv7.unr.ph
  %scevgep53 = getelementptr double, double* %scevgep52, i64 %111
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep50, %scevgep47
  %memcheck.conflict = and i1 %bound0, %bound1
  %112 = add nuw nsw i64 %indvars.iv7.unr.ph, 2
  %113 = shl nuw i64 %107, 1
  %114 = add i64 %112, %113
  %115 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %114, %115
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader107, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %116 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv7.unr.ph, %116
  %117 = add nsw i64 %offset.idx, -1
  %118 = getelementptr inbounds double, double* %3, i64 %117
  %119 = bitcast double* %118 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %119, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec55 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %120 = fadd <2 x double> %strided.vec, %strided.vec55
  %121 = add nuw nsw i64 %offset.idx, 1
  %122 = getelementptr inbounds double, double* %3, i64 %121
  %123 = getelementptr double, double* %122, i64 -1
  %124 = bitcast double* %123 to <4 x double>*
  %wide.vec56 = load <4 x double>, <4 x double>* %124, align 8, !alias.scope !20
  %strided.vec58 = shufflevector <4 x double> %wide.vec56, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %125 = fadd <2 x double> %120, %strided.vec58
  %126 = fmul <2 x double> %125, <double 3.333300e-01, double 3.333300e-01>
  %127 = bitcast double* %122 to <4 x double>*
  %wide.vec59 = load <4 x double>, <4 x double>* %127, align 8, !alias.scope !20
  %strided.vec61 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %128 = fadd <4 x double> %wide.vec56, %wide.vec59
  %129 = shufflevector <4 x double> %128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %130 = fadd <2 x double> %129, %strided.vec61
  %131 = fmul <2 x double> %130, <double 3.333300e-01, double 3.333300e-01>
  %132 = getelementptr inbounds double, double* %2, i64 %121
  %133 = getelementptr double, double* %132, i64 -1
  %134 = bitcast double* %133 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %126, <2 x double> %131, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %134, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %135 = icmp eq i64 %index.next, %n.vec
  br i1 %135, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph4.us.preheader107

.preheader3:                                      ; preds = %.preheader3, %.preheader3.preheader.new
  %136 = phi i32 [ %.unr, %.preheader3.preheader.new ], [ %137, %.preheader3 ]
  %137 = add nsw i32 %136, 8
  %exitcond20.7 = icmp eq i32 %137, %0
  br i1 %exitcond20.7, label %._crit_edge5.loopexit109.unr-lcssa, label %.preheader3

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5.loopexit109.unr-lcssa:               ; preds = %.preheader3
  br label %._crit_edge5.loopexit109

._crit_edge5.loopexit109:                         ; preds = %.preheader3.prol.loopexit, %._crit_edge5.loopexit109.unr-lcssa
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit109, %._crit_edge5.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
