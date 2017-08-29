; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %4 = sitofp i32 %0 to double
  store double %4, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %3
  %indvars.iv13 = phi i64 [ 0, %3 ], [ %indvars.iv.next14, %18 ]
  %5 = trunc i64 %indvars.iv13 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = fmul double %6, %9
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %6, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %7

; <label>:18:                                     ; preds = %7
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph90, label %.preheader71

.lr.ph90:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr65 = ptrtoint double* %5 to i64
  br i1 %8, label %.lr.ph90.split.us.preheader, label %.lr.ph90.split.preheader

.lr.ph90.split.preheader:                         ; preds = %.lr.ph90
  %9 = zext i32 %0 to i64
  %xtraiter170 = and i64 %9, 1
  %lcmp.mod171 = icmp eq i64 %xtraiter170, 0
  br i1 %lcmp.mod171, label %.lr.ph90.split.prol.loopexit, label %.lr.ph90.split.prol

.lr.ph90.split.prol:                              ; preds = %.lr.ph90.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  store double %10, double* %5, align 8
  br label %.lr.ph90.split.prol.loopexit

.lr.ph90.split.prol.loopexit:                     ; preds = %.lr.ph90.split.preheader, %.lr.ph90.split.prol
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph90.split.preheader ], [ 1, %.lr.ph90.split.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader71, label %.lr.ph90.split.preheader173

.lr.ph90.split.preheader173:                      ; preds = %.lr.ph90.split.prol.loopexit
  %12 = fdiv double 0.000000e+00, %2
  %13 = fdiv double 0.000000e+00, %2
  %14 = add nsw i64 %9, -2
  %15 = sub nsw i64 %14, %indvars.iv141.unr
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod214 = icmp eq i64 %17, 0
  br i1 %lcmp.mod214, label %.lr.ph90.split.prol.preheader, label %.lr.ph90.split.prol.loopexit212

.lr.ph90.split.prol.preheader:                    ; preds = %.lr.ph90.split.preheader173
  br label %.lr.ph90.split.prol215

.lr.ph90.split.prol215:                           ; preds = %.lr.ph90.split.prol.preheader
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv141.unr
  store double 0.000000e+00, double* %18, align 8
  %sunkaddr66.prol = shl nuw nsw i64 %indvars.iv141.unr, 3
  %sunkaddr67.prol = add i64 %sunkaddr65, %sunkaddr66.prol
  %sunkaddr68.prol = inttoptr i64 %sunkaddr67.prol to double*
  store double %12, double* %sunkaddr68.prol, align 8
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.unr, 1
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.prol
  store double 0.000000e+00, double* %19, align 8
  %sunkaddr66.1.prol = shl nuw nsw i64 %indvars.iv.next142.prol, 3
  %sunkaddr67.1.prol = add i64 %sunkaddr65, %sunkaddr66.1.prol
  %sunkaddr68.1.prol = inttoptr i64 %sunkaddr67.1.prol to double*
  store double %13, double* %sunkaddr68.1.prol, align 8
  %indvars.iv.next142.1.prol = or i64 %indvars.iv141.unr, 2
  br label %.lr.ph90.split.prol.loopexit212

.lr.ph90.split.prol.loopexit212:                  ; preds = %.lr.ph90.split.prol215, %.lr.ph90.split.preheader173
  %indvars.iv141.unr216 = phi i64 [ %indvars.iv141.unr, %.lr.ph90.split.preheader173 ], [ %indvars.iv.next142.1.prol, %.lr.ph90.split.prol215 ]
  %20 = icmp eq i64 %16, 0
  br i1 %20, label %.preheader71.loopexit203, label %.lr.ph90.split.preheader173.new

.lr.ph90.split.preheader173.new:                  ; preds = %.lr.ph90.split.prol.loopexit212
  br label %.lr.ph90.split

.lr.ph90.split.us.preheader:                      ; preds = %.lr.ph90
  %21 = zext i32 %1 to i64
  %22 = add nsw i64 %21, -1
  %23 = zext i32 %0 to i64
  %xtraiter164 = and i64 %21, 3
  %lcmp.mod165 = icmp eq i64 %xtraiter164, 0
  %24 = icmp ult i64 %22, 3
  br label %.lr.ph90.split.us

.lr.ph90.split.us:                                ; preds = %._crit_edge86.us, %.lr.ph90.split.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph90.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge86.us ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv137
  store double 0.000000e+00, double* %25, align 8
  %sunkaddr62.us = shl nsw i64 %indvars.iv137, 3
  %sunkaddr63.us = add i64 %sunkaddr, %sunkaddr62.us
  %sunkaddr64.us = inttoptr i64 %sunkaddr63.us to double*
  br i1 %lcmp.mod165, label %.prol.loopexit163, label %.prol.preheader162.preheader

.prol.preheader162.preheader:                     ; preds = %.lr.ph90.split.us
  br label %.prol.preheader162

.prol.preheader162:                               ; preds = %.prol.preheader162.preheader, %.prol.preheader162
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.prol.preheader162 ], [ 0, %.prol.preheader162.preheader ]
  %26 = phi double [ %29, %.prol.preheader162 ], [ 0.000000e+00, %.prol.preheader162.preheader ]
  %prol.iter166 = phi i64 [ %prol.iter166.sub, %.prol.preheader162 ], [ %xtraiter164, %.prol.preheader162.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133.prol, i64 %indvars.iv137
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  store double %29, double* %sunkaddr64.us, align 8
  %indvars.iv.next134.prol = add nuw nsw i64 %indvars.iv133.prol, 1
  %prol.iter166.sub = add nsw i64 %prol.iter166, -1
  %prol.iter166.cmp = icmp eq i64 %prol.iter166.sub, 0
  br i1 %prol.iter166.cmp, label %.prol.loopexit163.loopexit, label %.prol.preheader162, !llvm.loop !1

.prol.loopexit163.loopexit:                       ; preds = %.prol.preheader162
  br label %.prol.loopexit163

.prol.loopexit163:                                ; preds = %.prol.loopexit163.loopexit, %.lr.ph90.split.us
  %.lcssa145.unr = phi double [ undef, %.lr.ph90.split.us ], [ %29, %.prol.loopexit163.loopexit ]
  %indvars.iv133.unr = phi i64 [ 0, %.lr.ph90.split.us ], [ %xtraiter164, %.prol.loopexit163.loopexit ]
  %.unr167 = phi double [ 0.000000e+00, %.lr.ph90.split.us ], [ %29, %.prol.loopexit163.loopexit ]
  br i1 %24, label %._crit_edge86.us, label %.lr.ph90.split.us.new.preheader

.lr.ph90.split.us.new.preheader:                  ; preds = %.prol.loopexit163
  br label %.lr.ph90.split.us.new

.lr.ph90.split.us.new:                            ; preds = %.lr.ph90.split.us.new.preheader, %.lr.ph90.split.us.new
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.3, %.lr.ph90.split.us.new ], [ %indvars.iv133.unr, %.lr.ph90.split.us.new.preheader ]
  %30 = phi double [ %42, %.lr.ph90.split.us.new ], [ %.unr167, %.lr.ph90.split.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv137
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  store double %33, double* %sunkaddr64.us, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134, i64 %indvars.iv137
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  store double %36, double* %sunkaddr64.us, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.1, i64 %indvars.iv137
  %38 = load double, double* %37, align 8
  %39 = fadd double %36, %38
  store double %39, double* %sunkaddr64.us, align 8
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.2, i64 %indvars.iv137
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  store double %42, double* %sunkaddr64.us, align 8
  %indvars.iv.next134.3 = add nuw nsw i64 %indvars.iv133, 4
  %exitcond161.3 = icmp eq i64 %indvars.iv.next134.3, %21
  br i1 %exitcond161.3, label %._crit_edge86.us.loopexit, label %.lr.ph90.split.us.new

._crit_edge86.us.loopexit:                        ; preds = %.lr.ph90.split.us.new
  br label %._crit_edge86.us

._crit_edge86.us:                                 ; preds = %._crit_edge86.us.loopexit, %.prol.loopexit163
  %.lcssa145 = phi double [ %.lcssa145.unr, %.prol.loopexit163 ], [ %42, %._crit_edge86.us.loopexit ]
  %43 = fdiv double %.lcssa145, %2
  %sunkaddr66.us = shl nsw i64 %indvars.iv137, 3
  %sunkaddr67.us = add i64 %sunkaddr65, %sunkaddr66.us
  %sunkaddr68.us = inttoptr i64 %sunkaddr67.us to double*
  store double %43, double* %sunkaddr68.us, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next138, %23
  br i1 %exitcond168, label %.preheader71.loopexit, label %.lr.ph90.split.us

.preheader71.loopexit:                            ; preds = %._crit_edge86.us
  br label %.preheader71

.preheader71.loopexit203.unr-lcssa:               ; preds = %.lr.ph90.split
  br label %.preheader71.loopexit203

.preheader71.loopexit203:                         ; preds = %.lr.ph90.split.prol.loopexit212, %.preheader71.loopexit203.unr-lcssa
  br label %.preheader71

.preheader71:                                     ; preds = %.preheader71.loopexit203, %.preheader71.loopexit, %.lr.ph90.split.prol.loopexit, %6
  %44 = icmp sgt i32 %1, 0
  br i1 %44, label %.preheader70.lr.ph, label %.preheader69

.preheader70.lr.ph:                               ; preds = %.preheader71
  %45 = icmp sgt i32 %0, 0
  br i1 %45, label %.preheader70.us.preheader, label %._crit_edge78

.preheader70.us.preheader:                        ; preds = %.preheader70.lr.ph
  %46 = zext i32 %0 to i64
  %47 = add nsw i64 %46, -1
  %48 = zext i32 %1 to i64
  %xtraiter158 = and i64 %46, 3
  %lcmp.mod159 = icmp eq i64 %xtraiter158, 0
  %49 = icmp ult i64 %47, 3
  %50 = add nsw i64 %46, -4
  %51 = add nsw i64 %46, -4
  %scevgep190 = getelementptr double, double* %5, i64 4
  br label %.preheader70.us

.preheader70.us:                                  ; preds = %._crit_edge81.us, %.preheader70.us.preheader
  %indvars.iv128 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next129, %._crit_edge81.us ]
  %scevgep185 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 4
  br i1 %lcmp.mod159, label %.prol.loopexit157, label %.prol.preheader156.preheader

.prol.preheader156.preheader:                     ; preds = %.preheader70.us
  br label %.prol.preheader156

.prol.preheader156:                               ; preds = %.prol.preheader156.preheader, %.prol.preheader156
  %indvars.iv124.prol = phi i64 [ %indvars.iv.next125.prol, %.prol.preheader156 ], [ 0, %.prol.preheader156.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader156 ], [ %xtraiter158, %.prol.preheader156.preheader ]
  %52 = getelementptr inbounds double, double* %5, i64 %indvars.iv124.prol
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv124.prol
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next125.prol = add nuw nsw i64 %indvars.iv124.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit157.loopexit, label %.prol.preheader156, !llvm.loop !3

.prol.loopexit157.loopexit:                       ; preds = %.prol.preheader156
  br label %.prol.loopexit157

.prol.loopexit157:                                ; preds = %.prol.loopexit157.loopexit, %.preheader70.us
  %indvars.iv124.unr = phi i64 [ 0, %.preheader70.us ], [ %xtraiter158, %.prol.loopexit157.loopexit ]
  br i1 %49, label %._crit_edge81.us, label %.preheader70.us.new.preheader

.preheader70.us.new.preheader:                    ; preds = %.prol.loopexit157
  %57 = sub nsw i64 %50, %indvars.iv124.unr
  %58 = lshr i64 %57, 2
  %59 = add nuw nsw i64 %58, 1
  %min.iters.check = icmp ult i64 %59, 2
  br i1 %min.iters.check, label %.preheader70.us.new.preheader202, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader70.us.new.preheader
  %n.mod.vf = and i64 %59, 1
  %n.vec = sub nsw i64 %59, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader70.us.new.preheader202, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep183 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv124.unr
  %60 = sub nsw i64 %51, %indvars.iv124.unr
  %61 = and i64 %60, -4
  %62 = or i64 %indvars.iv124.unr, %61
  %scevgep186 = getelementptr double, double* %scevgep185, i64 %62
  %scevgep188 = getelementptr double, double* %5, i64 %indvars.iv124.unr
  %scevgep191 = getelementptr double, double* %scevgep190, i64 %62
  %bound0 = icmp ult double* %scevgep183, %scevgep191
  %bound1 = icmp ult double* %scevgep188, %scevgep186
  %memcheck.conflict = and i1 %bound0, %bound1
  %63 = or i64 %indvars.iv124.unr, 4
  %64 = shl nuw i64 %58, 2
  %65 = add i64 %63, %64
  %66 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %65, %66
  br i1 %memcheck.conflict, label %.preheader70.us.new.preheader202, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv124.unr, %67
  %68 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %69 = bitcast double* %68 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %69, align 8, !alias.scope !4
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %offset.idx
  %71 = bitcast double* %70 to <8 x double>*
  %wide.vec196 = load <8 x double>, <8 x double>* %71, align 8, !alias.scope !7, !noalias !4
  %72 = fsub <8 x double> %wide.vec196, %wide.vec
  %73 = shufflevector <8 x double> %72, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %74 = fsub <8 x double> %wide.vec196, %wide.vec
  %75 = shufflevector <8 x double> %74, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %76 = fsub <8 x double> %wide.vec196, %wide.vec
  %77 = shufflevector <8 x double> %76, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %78 = add nsw i64 %offset.idx, 3
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %78
  %80 = fsub <8 x double> %wide.vec196, %wide.vec
  %81 = shufflevector <8 x double> %80, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %82 = getelementptr double, double* %79, i64 -3
  %83 = bitcast double* %82 to <8 x double>*
  %84 = shufflevector <2 x double> %73, <2 x double> %75, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %85 = shufflevector <2 x double> %77, <2 x double> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %84, <4 x double> %85, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %83, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 2
  %86 = icmp eq i64 %index.next, %n.vec
  br i1 %86, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge81.us, label %.preheader70.us.new.preheader202

.preheader70.us.new.preheader202:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader70.us.new.preheader
  %indvars.iv124.ph = phi i64 [ %indvars.iv124.unr, %vector.memcheck ], [ %indvars.iv124.unr, %min.iters.checked ], [ %indvars.iv124.unr, %.preheader70.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader70.us.new

.preheader70.us.new:                              ; preds = %.preheader70.us.new.preheader202, %.preheader70.us.new
  %indvars.iv124 = phi i64 [ %indvars.iv.next125.3, %.preheader70.us.new ], [ %indvars.iv124.ph, %.preheader70.us.new.preheader202 ]
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv124
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv124
  %90 = load double, double* %89, align 8
  %91 = fsub double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next125
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv.next125
  %95 = load double, double* %94, align 8
  %96 = fsub double %95, %93
  store double %96, double* %94, align 8
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next125.1
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv.next125.1
  %100 = load double, double* %99, align 8
  %101 = fsub double %100, %98
  store double %101, double* %99, align 8
  %indvars.iv.next125.2 = add nsw i64 %indvars.iv124, 3
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next125.2
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv.next125.2
  %105 = load double, double* %104, align 8
  %106 = fsub double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next125.3 = add nuw nsw i64 %indvars.iv124, 4
  %exitcond155.3 = icmp eq i64 %indvars.iv.next125.3, %46
  br i1 %exitcond155.3, label %._crit_edge81.us.loopexit, label %.preheader70.us.new, !llvm.loop !12

._crit_edge81.us.loopexit:                        ; preds = %.preheader70.us.new
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us.loopexit, %middle.block, %.prol.loopexit157
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next129, %48
  br i1 %exitcond160, label %.preheader69.loopexit, label %.preheader70.us

.lr.ph90.split:                                   ; preds = %.lr.ph90.split, %.lr.ph90.split.preheader173.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr216, %.lr.ph90.split.preheader173.new ], [ %indvars.iv.next142.1.1, %.lr.ph90.split ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  store double 0.000000e+00, double* %107, align 8
  %sunkaddr66 = shl nsw i64 %indvars.iv141, 3
  %sunkaddr67 = add i64 %sunkaddr65, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  store double %12, double* %sunkaddr68, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %108 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142
  store double 0.000000e+00, double* %108, align 8
  %sunkaddr66.1 = shl nsw i64 %indvars.iv.next142, 3
  %sunkaddr67.1 = add i64 %sunkaddr65, %sunkaddr66.1
  %sunkaddr68.1 = inttoptr i64 %sunkaddr67.1 to double*
  store double %13, double* %sunkaddr68.1, align 8
  %indvars.iv.next142.1 = add nuw nsw i64 %indvars.iv141, 2
  %109 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.1
  store double 0.000000e+00, double* %109, align 8
  %sunkaddr66.1217 = shl nsw i64 %indvars.iv.next142.1, 3
  %sunkaddr67.1218 = add i64 %sunkaddr65, %sunkaddr66.1217
  %sunkaddr68.1219 = inttoptr i64 %sunkaddr67.1218 to double*
  store double %12, double* %sunkaddr68.1219, align 8
  %indvars.iv.next142.1220 = add nsw i64 %indvars.iv141, 3
  %110 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.1220
  store double 0.000000e+00, double* %110, align 8
  %sunkaddr66.1.1 = shl nsw i64 %indvars.iv.next142.1220, 3
  %sunkaddr67.1.1 = add i64 %sunkaddr65, %sunkaddr66.1.1
  %sunkaddr68.1.1 = inttoptr i64 %sunkaddr67.1.1 to double*
  store double %13, double* %sunkaddr68.1.1, align 8
  %indvars.iv.next142.1.1 = add nsw i64 %indvars.iv141, 4
  %exitcond169.1.1 = icmp eq i64 %indvars.iv.next142.1.1, %9
  br i1 %exitcond169.1.1, label %.preheader71.loopexit203.unr-lcssa, label %.lr.ph90.split

.preheader69.loopexit:                            ; preds = %._crit_edge81.us
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.loopexit, %.preheader71
  %111 = icmp sgt i32 %0, 0
  br i1 %111, label %.preheader.lr.ph, label %._crit_edge78

.preheader.lr.ph:                                 ; preds = %.preheader69
  %112 = icmp sgt i32 %1, 0
  %113 = fadd double %2, -1.000000e+00
  br i1 %112, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %114 = zext i32 %0 to i64
  %115 = add nsw i64 %114, -1
  %116 = fdiv double 0.000000e+00, %113
  %117 = fdiv double 0.000000e+00, %113
  %118 = fdiv double 0.000000e+00, %113
  %119 = add nsw i64 %114, -2
  br label %.lr.ph75

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %120 = zext i32 %1 to i64
  %121 = zext i32 %0 to i64
  %122 = zext i32 %0 to i64
  %xtraiter = and i64 %120, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %123 = icmp eq i32 %1, 1
  br label %.lr.ph75.us

.lr.ph75.us:                                      ; preds = %.preheader.us.preheader, %._crit_edge76.us-lcssa.us.us
  %indvars.iv110 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next111, %._crit_edge76.us-lcssa.us.us ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv110
  br label %.lr.ph.us.us

._crit_edge76.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next111, %122
  br i1 %exitcond148, label %._crit_edge78.loopexit, label %.lr.ph75.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph75.us
  %indvars.iv106 = phi i64 [ %indvars.iv110, %.lr.ph75.us ], [ %indvars.iv.next107, %._crit_edge.us.us ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv110, i64 %indvars.iv106
  store double 0.000000e+00, double* %125, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %126 = load double, double* %124, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv106
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fadd double %129, 0.000000e+00
  store double %130, double* %125, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %.lcssa.unr.ph = phi double [ %130, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %130, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %123, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %145, %._crit_edge.us.us.loopexit ]
  %131 = fdiv double %.lcssa, %113
  store double %131, double* %125, align 8
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv106, i64 %indvars.iv110
  store double %131, double* %132, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond = icmp eq i64 %indvars.iv.next107, %121
  br i1 %exitcond, label %._crit_edge76.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %133 = phi double [ %145, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv110
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv106
  %137 = load double, double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %133, %138
  store double %139, double* %125, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv110
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv106
  %143 = load double, double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  store double %145, double* %125, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond146.1 = icmp eq i64 %indvars.iv.next.1, %120
  br i1 %exitcond146.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph75:                                         ; preds = %.preheader.preheader, %._crit_edge76
  %indvars.iv120 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next121, %._crit_edge76 ]
  %146 = sub i64 %114, %indvars.iv120
  %xtraiter152 = and i64 %146, 1
  %lcmp.mod153 = icmp eq i64 %xtraiter152, 0
  br i1 %lcmp.mod153, label %.prol.loopexit151, label %.prol.preheader150

.prol.preheader150:                               ; preds = %.lr.ph75
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv120
  store double %118, double* %147, align 8
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv120, 1
  br label %.prol.loopexit151

.prol.loopexit151:                                ; preds = %.prol.preheader150, %.lr.ph75
  %indvars.iv116.unr.ph = phi i64 [ %indvars.iv.next117.prol, %.prol.preheader150 ], [ %indvars.iv120, %.lr.ph75 ]
  %148 = icmp eq i64 %115, %indvars.iv120
  br i1 %148, label %._crit_edge76, label %.lr.ph75.new.preheader

.lr.ph75.new.preheader:                           ; preds = %.prol.loopexit151
  %149 = sub i64 %119, %indvars.iv116.unr.ph
  %150 = lshr i64 %149, 1
  %151 = and i64 %150, 1
  %lcmp.mod208 = icmp eq i64 %151, 0
  br i1 %lcmp.mod208, label %.lr.ph75.new.prol.preheader, label %.lr.ph75.new.prol.loopexit.unr-lcssa

.lr.ph75.new.prol.preheader:                      ; preds = %.lr.ph75.new.preheader
  br label %.lr.ph75.new.prol

.lr.ph75.new.prol:                                ; preds = %.lr.ph75.new.prol.preheader
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv116.unr.ph
  store double %116, double* %152, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv116.unr.ph, i64 %indvars.iv120
  store double %116, double* %153, align 8
  %indvars.iv.next117.prol209 = add nuw nsw i64 %indvars.iv116.unr.ph, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv.next117.prol209
  store double %117, double* %154, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117.prol209, i64 %indvars.iv120
  store double %117, double* %155, align 8
  %indvars.iv.next117.1.prol = add nsw i64 %indvars.iv116.unr.ph, 2
  br label %.lr.ph75.new.prol.loopexit.unr-lcssa

.lr.ph75.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph75.new.preheader, %.lr.ph75.new.prol
  %indvars.iv116.unr.ph210 = phi i64 [ %indvars.iv.next117.1.prol, %.lr.ph75.new.prol ], [ %indvars.iv116.unr.ph, %.lr.ph75.new.preheader ]
  br label %.lr.ph75.new.prol.loopexit

.lr.ph75.new.prol.loopexit:                       ; preds = %.lr.ph75.new.prol.loopexit.unr-lcssa
  %156 = icmp eq i64 %150, 0
  br i1 %156, label %._crit_edge76.loopexit, label %.lr.ph75.new.preheader.new

.lr.ph75.new.preheader.new:                       ; preds = %.lr.ph75.new.prol.loopexit
  br label %.lr.ph75.new

.lr.ph75.new:                                     ; preds = %.lr.ph75.new, %.lr.ph75.new.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr.ph210, %.lr.ph75.new.preheader.new ], [ %indvars.iv.next117.1.1, %.lr.ph75.new ]
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv116
  store double %116, double* %157, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv116, i64 %indvars.iv120
  store double %116, double* %158, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv.next117
  store double %117, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117, i64 %indvars.iv120
  store double %117, double* %160, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv.next117.1
  store double %116, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117.1, i64 %indvars.iv120
  store double %116, double* %162, align 8
  %indvars.iv.next117.1211 = add nsw i64 %indvars.iv116, 3
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv.next117.1211
  store double %117, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117.1211, i64 %indvars.iv120
  store double %117, double* %164, align 8
  %indvars.iv.next117.1.1 = add nsw i64 %indvars.iv116, 4
  %exitcond149.1.1 = icmp eq i64 %indvars.iv.next117.1.1, %114
  br i1 %exitcond149.1.1, label %._crit_edge76.loopexit.unr-lcssa, label %.lr.ph75.new

._crit_edge76.loopexit.unr-lcssa:                 ; preds = %.lr.ph75.new
  br label %._crit_edge76.loopexit

._crit_edge76.loopexit:                           ; preds = %.lr.ph75.new.prol.loopexit, %._crit_edge76.loopexit.unr-lcssa
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %.prol.loopexit151
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next121, %114
  br i1 %exitcond154, label %._crit_edge78.loopexit201, label %.lr.ph75

._crit_edge78.loopexit:                           ; preds = %._crit_edge76.us-lcssa.us.us
  br label %._crit_edge78

._crit_edge78.loopexit201:                        ; preds = %._crit_edge76
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit201, %._crit_edge78.loopexit, %.preheader70.lr.ph, %.preheader69
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %8
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.preheader.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond20, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %10
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
