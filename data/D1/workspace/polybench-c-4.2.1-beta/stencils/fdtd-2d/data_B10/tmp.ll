; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %19

; <label>:19:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph4.preheader, label %.preheader1

.lr.ph4.preheader:                                ; preds = %7
  %9 = add i32 %0, -1
  %xtraiter = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph4.prol.loopexit, label %.lr.ph4.prol.preheader

.lr.ph4.prol.preheader:                           ; preds = %.lr.ph4.preheader
  br label %.lr.ph4.prol

.lr.ph4.prol:                                     ; preds = %.lr.ph4.prol.preheader, %.lr.ph4.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph4.prol ], [ 0, %.lr.ph4.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph4.prol ], [ %xtraiter, %.lr.ph4.prol.preheader ]
  %10 = trunc i64 %indvars.iv11.prol to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %indvars.iv11.prol
  store double %11, double* %12, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph4.prol.loopexit.loopexit, label %.lr.ph4.prol, !llvm.loop !1

.lr.ph4.prol.loopexit.loopexit:                   ; preds = %.lr.ph4.prol
  br label %.lr.ph4.prol.loopexit

.lr.ph4.prol.loopexit:                            ; preds = %.lr.ph4.prol.loopexit.loopexit, %.lr.ph4.preheader
  %indvars.iv11.unr = phi i64 [ 0, %.lr.ph4.preheader ], [ %indvars.iv.next12.prol, %.lr.ph4.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %9, 7
  br i1 %13, label %.preheader1, label %.lr.ph4.preheader15

.lr.ph4.preheader15:                              ; preds = %.lr.ph4.prol.loopexit
  %wide.trip.count13.7 = zext i32 %0 to i64
  br label %.lr.ph4

.preheader1.loopexit:                             ; preds = %.lr.ph4
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %.lr.ph4.prol.loopexit, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.preheader.lr.ph, label %._crit_edge2

.preheader.lr.ph:                                 ; preds = %.preheader1
  %15 = icmp sgt i32 %2, 0
  %16 = sitofp i32 %1 to double
  %17 = sitofp i32 %2 to double
  %18 = insertelement <2 x double> undef, double %16, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge2

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count8 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %20 = trunc i64 %indvars.iv6 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %26, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %23, %32
  %34 = fdiv <2 x double> %33, %19
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  store double %35, double* %27, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv
  store double %36, double* %37, align 8
  %38 = add nuw nsw i64 %indvars.iv, 3
  %39 = trunc i64 %38 to i32
  %40 = sitofp i32 %39 to double
  %41 = fmul double %21, %40
  %42 = fdiv double %41, %16
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge2.loopexit, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4.preheader15, %.lr.ph4
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph4 ], [ %indvars.iv11.unr, %.lr.ph4.preheader15 ]
  %44 = trunc i64 %indvars.iv11 to i32
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %47 = bitcast double* %46 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %48 = trunc i64 %indvars.iv.next12 to i32
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %45, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  store <2 x double> %51, <2 x double>* %47, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %52 = trunc i64 %indvars.iv.next12.1 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %55 = bitcast double* %54 to <2 x double>*
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %56 = trunc i64 %indvars.iv.next12.2 to i32
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  store <2 x double> %59, <2 x double>* %55, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %60 = trunc i64 %indvars.iv.next12.3 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  %63 = bitcast double* %62 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %64 = trunc i64 %indvars.iv.next12.4 to i32
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %61, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %68 = trunc i64 %indvars.iv.next12.5 to i32
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.5
  %71 = bitcast double* %70 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %72 = trunc i64 %indvars.iv.next12.6 to i32
  %73 = sitofp i32 %72 to double
  %74 = insertelement <2 x double> undef, double %69, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  store <2 x double> %75, <2 x double>* %71, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, %wide.trip.count13.7
  br i1 %exitcond14.7, label %.preheader1.loopexit, label %.lr.ph4

._crit_edge2.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit, %.preheader.lr.ph, %.preheader1
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader6.lr.ph, label %._crit_edge13

.preheader6.lr.ph:                                ; preds = %7
  %9 = add nsw i32 %1, -1
  %10 = add nsw i32 %2, -1
  %xtraiter = and i32 %2, 7
  %wide.trip.count.7 = zext i32 %2 to i64
  %xtraiter22 = and i32 %2, 1
  %wide.trip.count27 = zext i32 %1 to i64
  %xtraiter35 = and i32 %10, 1
  %wide.trip.count48 = zext i32 %9 to i64
  %wide.trip.count44 = zext i32 %10 to i64
  %wide.trip.count52 = zext i32 %0 to i64
  %11 = add nuw nsw i64 %wide.trip.count44, 1
  %12 = add nsw i64 %wide.trip.count.7, -2
  %13 = add nsw i64 %wide.trip.count.7, -2
  %14 = add nsw i64 %wide.trip.count.7, -2
  %15 = add nsw i64 %wide.trip.count.7, -2
  %16 = icmp sgt i32 %2, 0
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp ult i32 %10, 7
  %sunkaddr177 = ptrtoint double* %6 to i64
  %sunkaddr = ptrtoint double* %6 to i64
  %.not = icmp slt i32 %1, 2
  %.not54 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not54
  %.not55 = icmp slt i32 %1, 1
  %.not56 = icmp slt i32 %2, 2
  %brmerge57 = or i1 %.not55, %.not56
  %19 = icmp slt i32 %2, 2
  %20 = icmp slt i32 %1, 2
  %brmerge60 = or i1 %20, %19
  %min.iters.check = icmp ult i32 %10, 4
  %21 = and i32 %10, 3
  %n.mod.vf = zext i32 %21 to i64
  %n.vec = sub nsw i64 %wide.trip.count44, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %21, 0
  %22 = icmp eq i32 %xtraiter35, 0
  %23 = icmp eq i32 %2, 2
  %24 = icmp eq i32 %xtraiter22, 0
  %25 = icmp eq i32 %10, 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  br i1 %16, label %.lr.ph, label %.preheader5

.lr.ph:                                           ; preds = %.preheader6
  br i1 %17, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  %sunkaddr174 = mul i64 %indvars.iv50, 8
  %sunkaddr175 = add i64 %sunkaddr, %sunkaddr174
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to i64*
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = load i64, i64* %sunkaddr176, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.prol
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %18, label %.preheader5, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr178 = mul i64 %indvars.iv50, 8
  %sunkaddr179 = add i64 %sunkaddr177, %sunkaddr178
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to i64*
  br label %.lr.ph.new

.preheader5.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.prol.loopexit, %.preheader6
  br i1 %brmerge, label %.preheader4, label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader5
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %29 = add i64 %indvar, 1
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %4, i64 %29, i64 2
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %5, i64 %29, i64 2
  %30 = add nsw i64 %indvars.iv25, -1
  br i1 %24, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %.preheader2.us
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 0
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 0
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %30, i64 0
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.preheader20, %.preheader2.us
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %.preheader2.us ]
  br i1 %25, label %._crit_edge.us, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.prol.loopexit21
  %40 = sub nsw i64 %14, %indvars.iv17.unr.ph
  %41 = lshr i64 %40, 1
  %42 = add nuw i64 %41, 1
  %min.iters.check129 = icmp ult i64 %42, 2
  br i1 %min.iters.check129, label %.preheader2.us.new.preheader173, label %min.iters.checked130

min.iters.checked130:                             ; preds = %.preheader2.us.new.preheader
  %n.mod.vf131 = and i64 %42, 1
  %n.vec132 = sub i64 %42, %n.mod.vf131
  %cmp.zero133 = icmp eq i64 %n.vec132, 0
  br i1 %cmp.zero133, label %.preheader2.us.new.preheader173, label %vector.memcheck151

vector.memcheck151:                               ; preds = %min.iters.checked130
  %scevgep136 = getelementptr [1200 x double], [1200 x double]* %4, i64 %29, i64 %indvars.iv17.unr.ph
  %43 = sub nsw i64 %15, %indvars.iv17.unr.ph
  %44 = and i64 %43, -2
  %45 = or i64 %indvars.iv17.unr.ph, %44
  %scevgep139 = getelementptr double, double* %scevgep138, i64 %45
  %scevgep142 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 %indvars.iv17.unr.ph
  %scevgep145 = getelementptr double, double* %scevgep144, i64 %45
  %bound0147 = icmp ult double* %scevgep136, %scevgep145
  %bound1148 = icmp ult double* %scevgep142, %scevgep139
  %memcheck.conflict150 = and i1 %bound0147, %bound1148
  %46 = or i64 %indvars.iv17.unr.ph, 2
  %47 = shl nuw i64 %41, 1
  %48 = add i64 %46, %47
  %49 = shl nuw nsw i64 %n.mod.vf131, 1
  %ind.end156 = sub i64 %48, %49
  br i1 %memcheck.conflict150, label %.preheader2.us.new.preheader173, label %vector.body126.preheader

vector.body126.preheader:                         ; preds = %vector.memcheck151
  br label %vector.body126

vector.body126:                                   ; preds = %vector.body126.preheader, %vector.body126
  %index153 = phi i64 [ %index.next154, %vector.body126 ], [ 0, %vector.body126.preheader ]
  %50 = shl i64 %index153, 1
  %offset.idx158 = or i64 %indvars.iv17.unr.ph, %50
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %offset.idx158
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec162 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !4, !noalias !7
  %strided.vec163 = shufflevector <4 x double> %wide.vec162, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec164 = shufflevector <4 x double> %wide.vec162, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %offset.idx158
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec165 = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !7
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %30, i64 %offset.idx158
  %56 = bitcast double* %55 to <4 x double>*
  %wide.vec168 = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !7
  %57 = fsub <4 x double> %wide.vec165, %wide.vec168
  %58 = shufflevector <4 x double> %57, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %59 = fmul <2 x double> %58, <double 5.000000e-01, double 5.000000e-01>
  %60 = fsub <2 x double> %strided.vec163, %59
  %61 = add nuw nsw i64 %offset.idx158, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %61
  %63 = fsub <4 x double> %wide.vec165, %wide.vec168
  %64 = shufflevector <4 x double> %63, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %65 = fmul <2 x double> %64, <double 5.000000e-01, double 5.000000e-01>
  %66 = fsub <2 x double> %strided.vec164, %65
  %67 = getelementptr double, double* %62, i64 -1
  %68 = bitcast double* %67 to <4 x double>*
  %interleaved.vec171 = shufflevector <2 x double> %60, <2 x double> %66, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec171, <4 x double>* %68, align 8, !alias.scope !4, !noalias !7
  %index.next154 = add i64 %index153, 2
  %69 = icmp eq i64 %index.next154, %n.vec132
  br i1 %69, label %middle.block127, label %vector.body126, !llvm.loop !9

middle.block127:                                  ; preds = %vector.body126
  %cmp.n157 = icmp eq i64 %n.mod.vf131, 0
  br i1 %cmp.n157, label %._crit_edge.us, label %.preheader2.us.new.preheader173

.preheader2.us.new.preheader173:                  ; preds = %middle.block127, %vector.memcheck151, %min.iters.checked130, %.preheader2.us.new.preheader
  %indvars.iv17.ph = phi i64 [ %indvars.iv17.unr.ph, %vector.memcheck151 ], [ %indvars.iv17.unr.ph, %min.iters.checked130 ], [ %indvars.iv17.unr.ph, %.preheader2.us.new.preheader ], [ %ind.end156, %middle.block127 ]
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader173, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ %indvars.iv17.ph, %.preheader2.us.new.preheader173 ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv17
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv17
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %30, i64 %indvars.iv17
  %75 = load double, double* %74, align 8
  %76 = fsub double %73, %75
  %77 = fmul double %76, 5.000000e-01
  %78 = fsub double %71, %77
  store double %78, double* %70, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next18
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next18
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %30, i64 %indvars.iv.next18
  %84 = load double, double* %83, align 8
  %85 = fsub double %82, %84
  %86 = fmul double %85, 5.000000e-01
  %87 = fsub double %80, %86
  store double %87, double* %79, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count.7
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !12

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block127, %.prol.loopexit21
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader4.loopexit, label %.preheader2.us

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %88 = load i64, i64* %sunkaddr180, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %91 = load i64, i64* %sunkaddr180, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %94 = load i64, i64* %sunkaddr180, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %97 = load i64, i64* %sunkaddr180, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %100 = load i64, i64* %sunkaddr180, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %103 = load i64, i64* %sunkaddr180, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %106 = load i64, i64* %sunkaddr180, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %109 = load i64, i64* %sunkaddr180, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %.preheader5.loopexit, label %.lr.ph.new

.preheader4.loopexit:                             ; preds = %._crit_edge.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5
  br i1 %brmerge57, label %.preheader3, label %.preheader1.us.preheader

.preheader1.us.preheader:                         ; preds = %.preheader4
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 2
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 -1
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 2
  br i1 %22, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.preheader1.us
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %117 = load double, double* %116, align 8
  %118 = fsub double %115, %117
  %119 = fmul double %118, 5.000000e-01
  %120 = fsub double %113, %119
  store double %120, double* %112, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.prol.preheader33, %.preheader1.us
  %indvars.iv29.unr.ph = phi i64 [ 2, %.prol.preheader33 ], [ 1, %.preheader1.us ]
  br i1 %23, label %._crit_edge9.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.prol.loopexit34
  %121 = sub nsw i64 %12, %indvars.iv29.unr.ph
  %122 = lshr i64 %121, 1
  %123 = add nuw i64 %122, 1
  %min.iters.check88 = icmp ult i64 %123, 2
  br i1 %min.iters.check88, label %.preheader1.us.new.preheader172, label %min.iters.checked89

min.iters.checked89:                              ; preds = %.preheader1.us.new.preheader
  %n.mod.vf90 = and i64 %123, 1
  %n.vec91 = sub i64 %123, %n.mod.vf90
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  br i1 %cmp.zero92, label %.preheader1.us.new.preheader172, label %vector.memcheck110

vector.memcheck110:                               ; preds = %min.iters.checked89
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv29.unr.ph
  %124 = sub nsw i64 %13, %indvars.iv29.unr.ph
  %125 = and i64 %124, -2
  %126 = add nsw i64 %indvars.iv29.unr.ph, %125
  %scevgep98 = getelementptr double, double* %scevgep97, i64 %126
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %indvars.iv29.unr.ph
  %scevgep104 = getelementptr double, double* %scevgep103, i64 %126
  %bound0106 = icmp ult double* %scevgep95, %scevgep104
  %bound1107 = icmp ult double* %scevgep101, %scevgep98
  %memcheck.conflict109 = and i1 %bound0106, %bound1107
  %127 = add nuw nsw i64 %indvars.iv29.unr.ph, 2
  %128 = shl nuw i64 %122, 1
  %129 = add i64 %127, %128
  %130 = shl nuw nsw i64 %n.mod.vf90, 1
  %ind.end = sub i64 %129, %130
  br i1 %memcheck.conflict109, label %.preheader1.us.new.preheader172, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %vector.memcheck110
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index112 = phi i64 [ %index.next113, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %131 = shl i64 %index112, 1
  %offset.idx = or i64 %indvars.iv29.unr.ph, %131
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %offset.idx
  %133 = bitcast double* %132 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %133, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec119 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %135 = getelementptr double, double* %134, i64 -1
  %136 = bitcast double* %135 to <4 x double>*
  %wide.vec120 = load <4 x double>, <4 x double>* %136, align 8, !alias.scope !16
  %strided.vec121 = shufflevector <4 x double> %wide.vec120, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec122 = shufflevector <4 x double> %wide.vec120, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %137 = fsub <2 x double> %strided.vec122, %strided.vec121
  %138 = fmul <2 x double> %137, <double 5.000000e-01, double 5.000000e-01>
  %139 = fsub <2 x double> %strided.vec, %138
  %140 = add nuw nsw i64 %offset.idx, 1
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %140
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %140
  %143 = getelementptr double, double* %142, i64 -1
  %144 = bitcast double* %143 to <4 x double>*
  %wide.vec123 = load <4 x double>, <4 x double>* %144, align 8, !alias.scope !16
  %strided.vec124 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec125 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %145 = fsub <2 x double> %strided.vec125, %strided.vec124
  %146 = fmul <2 x double> %145, <double 5.000000e-01, double 5.000000e-01>
  %147 = fsub <2 x double> %strided.vec119, %146
  %148 = getelementptr double, double* %141, i64 -1
  %149 = bitcast double* %148 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %139, <2 x double> %147, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %149, align 8, !alias.scope !13, !noalias !16
  %index.next113 = add i64 %index112, 2
  %150 = icmp eq i64 %index.next113, %n.vec91
  br i1 %150, label %middle.block86, label %vector.body85, !llvm.loop !18

middle.block86:                                   ; preds = %vector.body85
  %cmp.n115 = icmp eq i64 %n.mod.vf90, 0
  br i1 %cmp.n115, label %._crit_edge9.us, label %.preheader1.us.new.preheader172

.preheader1.us.new.preheader172:                  ; preds = %middle.block86, %vector.memcheck110, %min.iters.checked89, %.preheader1.us.new.preheader
  %indvars.iv29.ph = phi i64 [ %indvars.iv29.unr.ph, %vector.memcheck110 ], [ %indvars.iv29.unr.ph, %min.iters.checked89 ], [ %indvars.iv29.unr.ph, %.preheader1.us.new.preheader ], [ %ind.end, %middle.block86 ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader172, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader172 ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv29
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %154 = load double, double* %153, align 8
  %155 = add nsw i64 %indvars.iv29, -1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %155
  %157 = load double, double* %156, align 8
  %158 = fsub double %154, %157
  %159 = fmul double %158, 5.000000e-01
  %160 = fsub double %152, %159
  store double %160, double* %151, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next30
  %162 = load double, double* %161, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %164 = load double, double* %163, align 8
  %165 = load double, double* %153, align 8
  %166 = fsub double %164, %165
  %167 = fmul double %166, 5.000000e-01
  %168 = fsub double %162, %167
  store double %168, double* %161, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, %wide.trip.count.7
  br i1 %exitcond32.1, label %._crit_edge9.us.loopexit, label %.preheader1.us.new, !llvm.loop !19

._crit_edge9.us.loopexit:                         ; preds = %.preheader1.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %middle.block86, %.prol.loopexit34
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count27
  br i1 %exitcond40, label %.preheader3.loopexit, label %.preheader1.us

.preheader3.loopexit:                             ; preds = %._crit_edge9.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader4
  br i1 %brmerge60, label %._crit_edge12, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader3
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %wide.trip.count44
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %11
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 0
  %169 = add i64 %indvars.iv46, 1
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %4, i64 %169, i64 %wide.trip.count44
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep62
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %index
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !20, !noalias !23
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %173, align 8, !alias.scope !20, !noalias !23
  %174 = or i64 %index, 1
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %174
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !26
  %177 = getelementptr double, double* %175, i64 2
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !26
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %index
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !26
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %182, align 8, !alias.scope !26
  %183 = fsub <2 x double> %wide.load77, %wide.load79
  %184 = fsub <2 x double> %wide.load78, %wide.load80
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %index
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !27
  %187 = getelementptr double, double* %185, i64 2
  %188 = bitcast double* %187 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %188, align 8, !alias.scope !27
  %189 = fadd <2 x double> %183, %wide.load81
  %190 = fadd <2 x double> %184, %wide.load82
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %index
  %192 = bitcast double* %191 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %192, align 8, !alias.scope !27
  %193 = getelementptr double, double* %191, i64 2
  %194 = bitcast double* %193 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %194, align 8, !alias.scope !27
  %195 = fsub <2 x double> %189, %wide.load83
  %196 = fsub <2 x double> %190, %wide.load84
  %197 = fmul <2 x double> %195, <double 7.000000e-01, double 7.000000e-01>
  %198 = fmul <2 x double> %196, <double 7.000000e-01, double 7.000000e-01>
  %199 = fsub <2 x double> %wide.load, %197
  %200 = fsub <2 x double> %wide.load76, %198
  %201 = bitcast double* %170 to <2 x double>*
  store <2 x double> %199, <2 x double>* %201, align 8, !alias.scope !20, !noalias !23
  %202 = bitcast double* %172 to <2 x double>*
  store <2 x double> %200, <2 x double>* %202, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %203 = icmp eq i64 %index.next, %n.vec
  br i1 %203, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge11.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %indvars.iv42.ph, %scalar.ph.preheader ]
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv42
  %205 = load double, double* %204, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next43
  %207 = load double, double* %206, align 8
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42
  %209 = load double, double* %208, align 8
  %210 = fsub double %207, %209
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv42
  %212 = load double, double* %211, align 8
  %213 = fadd double %210, %212
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv42
  %215 = load double, double* %214, align 8
  %216 = fsub double %213, %215
  %217 = fmul double %216, 7.000000e-01
  %218 = fsub double %205, %217
  store double %218, double* %204, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge11.us.loopexit, label %scalar.ph, !llvm.loop !29

._crit_edge11.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %middle.block
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader3
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge13.loopexit, label %.preheader6

._crit_edge13.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader8.us.preheader, label %._crit_edge12.critedge

.preheader8.us.preheader:                         ; preds = %5
  %12 = sext i32 %0 to i64
  %wide.trip.count35 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %13 = mul nsw i64 %indvars.iv37, %12
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %21 ]
  %15 = add nsw i64 %indvars.iv33, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv33
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge14.us, label %14

._crit_edge14.us:                                 ; preds = %21
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br i1 %or.cond, label %.preheader7.us.preheader, label %._crit_edge9.critedge

.preheader7.us.preheader:                         ; preds = %._crit_edge15
  %32 = sext i32 %0 to i64
  %wide.trip.count26 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %33 = mul nsw i64 %indvars.iv28, %32
  br label %34

; <label>:34:                                     ; preds = %41, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %41 ]
  %35 = add nsw i64 %indvars.iv24, %33
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 20
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %34
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %40) #5
  br label %41

; <label>:41:                                     ; preds = %39, %34
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv24
  %44 = load double, double* %43, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %44) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %._crit_edge11.us, label %34

._crit_edge11.us:                                 ; preds = %41
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge12.loopexit, label %.preheader7.us

._crit_edge12.critedge:                           ; preds = %5
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #5
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge12.critedge
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %._crit_edge12
  %56 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count21 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us ]
  %57 = mul nsw i64 %indvars.iv19, %56
  br label %58

; <label>:58:                                     ; preds = %65, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %65 ]
  %59 = add nsw i64 %indvars.iv, %57
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, 20
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %58
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %64) #5
  br label %65

; <label>:65:                                     ; preds = %63, %58
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %68) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %58

._crit_edge.us:                                   ; preds = %65
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.critedge:                            ; preds = %._crit_edge15
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.critedge, %._crit_edge12
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
